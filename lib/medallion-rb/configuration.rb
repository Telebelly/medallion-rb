module MedallionRb
  class Configuration
    # Defines url scheme
    attr_accessor :scheme

    # Defines url host
    attr_accessor :host

    # Defines url base path
    attr_accessor :base_path

    # Defines the API key used with x-api-key header authentication.
    #
    # @return [String]
    attr_accessor :api_key

    # Set this to enable/disable debugging. When enabled (set to true), HTTP request/response
    # details will be logged with `logger.debug` (see the `logger` attribute).
    # Default to false.
    #
    # @return [true, false]
    attr_accessor :debugging

    # Defines the logger used for debugging.
    # Default to `Rails.logger` (when in Rails) or logging to STDOUT.
    #
    # @return [#debug]
    attr_accessor :logger

    # Defines the temporary folder to store downloaded files
    # (for API endpoints that have file response).
    # Default to use `Tempfile`.
    #
    # @return [String]
    attr_accessor :temp_folder_path

    # The time limit for HTTP request in seconds.
    # Default to 0 (never times out).
    attr_accessor :timeout

    # Set this to false to skip client side validation in the operation.
    # Default to true.
    # @return [true, false]
    attr_accessor :client_side_validation

    ### TLS/SSL setting
    # Set this to false to skip verifying SSL certificate when calling API from https server.
    # Default to true.
    #
    # @return [true, false]
    attr_accessor :ssl_verify

    ### TLS/SSL setting
    # Any `OpenSSL::SSL::` constant
    attr_accessor :ssl_verify_mode

    ### TLS/SSL setting
    # Set this to customize the certificate file to verify the peer.
    #
    # @return [String] the path to the certificate file
    attr_accessor :ssl_ca_file

    ### TLS/SSL setting
    # Client certificate file (for client certificate)
    attr_accessor :ssl_client_cert

    ### TLS/SSL setting
    # Client private key file (for client certificate)
    attr_accessor :ssl_client_key

    ### Proxy setting
    # HTTP Proxy settings
    attr_accessor :proxy

    # Set this to customize parameters encoder of array parameter.
    # Default to nil. Faraday uses NestedParamsEncoder when nil.
    attr_accessor :params_encoder

    attr_accessor :inject_format

    attr_accessor :force_ending_format

    def initialize
      @scheme = 'https'
      @host = 'api.medallion.co'
      @base_path = '/api/v1'
      @api_key = nil
      @client_side_validation = true
      @ssl_verify = true
      @ssl_verify_mode = nil
      @ssl_ca_file = nil
      @ssl_client_cert = nil
      @ssl_client_key = nil
      @middlewares = Hash.new { |h, k| h[k] = [] }
      @configure_connection_blocks = []
      @timeout = 60
      @params_encoder = nil
      @debugging = false
      @inject_format = false
      @force_ending_format = false
      @logger = defined?(Rails) ? Rails.logger : Logger.new(STDOUT)

      yield(self) if block_given?
    end

    # The default Configuration object.
    def self.default
      @@default ||= Configuration.new
    end

    def configure
      yield(self) if block_given?
    end

    def scheme=(scheme)
      # remove :// from scheme
      @scheme = scheme.sub(/:\/\//, '')
    end

    def host=(host)
      # remove http(s):// and anything after a slash
      @host = host.sub(/https?:\/\//, '').split('/').first
    end

    def base_path=(base_path)
      # Add leading and trailing slashes to base_path
      @base_path = "/#{base_path}".gsub(/\/+/, '/')
      @base_path = '' if @base_path == '/'
    end

    # Returns base URL for specified operation based on server settings
    def base_url(_operation = nil)
      "#{scheme}://#{[host, base_path].join('/').gsub(/\/+/, '/')}".sub(/\/+\z/, '')
    end

    # Returns Auth Settings hash for api client.
    def auth_settings
      {
        'ApiKeyAuth' =>
          {
            type: 'api_key',
            in: 'header',
            key: 'x-api-key',
            value: api_key
          },
      }
    end

    # Configure Faraday connection directly.
    #
    # @param block [Proc] `#call`able object that takes one arg, the connection
    def configure_faraday_connection(&block)
      @configure_connection_blocks << block
    end

    def configure_connection(conn)
      @configure_connection_blocks.each do |block|
        block.call(conn)
      end
    end

    # Adds middleware to the stack
    def use(*middleware)
      set_faraday_middleware(:use, *middleware)
    end

    # Adds request middleware to the stack
    def request(*middleware)
      set_faraday_middleware(:request, *middleware)
    end

    # Adds response middleware to the stack
    def response(*middleware)
      set_faraday_middleware(:response, *middleware)
    end

    # Adds Faraday middleware setting information to the stack
    def set_faraday_middleware(operation, key, *args, &block)
      unless [:request, :response, :use, :insert, :insert_before, :insert_after, :swap, :delete].include?(operation)
        fail ArgumentError, "Invalid faraday middleware operation #{operation}. Must be" \
                            " :request, :response, :use, :insert, :insert_before, :insert_after, :swap or :delete."
      end

      @middlewares[operation] << [key, args, block]
    end
    ruby2_keywords(:set_faraday_middleware) if respond_to?(:ruby2_keywords, true)

    # Set up middleware on the connection
    def configure_middleware(connection)
      return if @middlewares.empty?

      [:request, :response, :use, :insert, :insert_before, :insert_after, :swap].each do |operation|
        next unless @middlewares.key?(operation)

        @middlewares[operation].each do |key, args, block|
          connection.builder.send(operation, key, *args, &block)
        end
      end

      if @middlewares.key?(:delete)
        @middlewares[:delete].each do |key, _args, _block|
          connection.builder.delete(key)
        end
      end
    end
  end
end
