require 'cgi'

module MedallionRb
  class ProvidersApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # List providers (paginated)
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return per page
    # @option opts [Integer] :offset The initial index from which to return the results
    # @option opts [String] :ordering Which field to use when ordering the results
    # @option opts [String] :search A search term
    # @option opts [String] :employment_status Filter by employment status
    # @option opts [String] :id Filter by provider ID
    # @option opts [String] :npi Filter by NPI number
    # @return [PaginatedOrgProviderList]
    def list_providers(opts = {})
      data, _status_code, _headers = list_providers_with_http_info(opts)
      data
    end

    # List providers (paginated)
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return per page
    # @option opts [Integer] :offset The initial index from which to return the results
    # @option opts [String] :ordering Which field to use when ordering the results
    # @option opts [String] :search A search term
    # @option opts [String] :employment_status Filter by employment status
    # @option opts [String] :id Filter by provider ID
    # @option opts [String] :npi Filter by NPI number
    # @return [Array<(PaginatedOrgProviderList, Integer, Hash)>] PaginatedOrgProviderList data, response status code and response headers
    def list_providers_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProvidersApi.list_providers ...'
      end
      # resource path
      local_var_path = '/org/providers/'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'ordering'] = opts[:'ordering'] if !opts[:'ordering'].nil?
      query_params[:'search'] = opts[:'search'] if !opts[:'search'].nil?
      query_params[:'employment_status'] = opts[:'employment_status'] if !opts[:'employment_status'].nil?
      query_params[:'id'] = opts[:'id'] if !opts[:'id'].nil?
      query_params[:'npi'] = opts[:'npi'] if !opts[:'npi'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'PaginatedOrgProviderList'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKeyAuth']

      new_options = opts.merge(
        :operation => :"ProvidersApi.list_providers",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProvidersApi#list_providers\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Retrieve a specific provider
    # @param id [String] ID of the provider to return
    # @param [Hash] opts the optional parameters
    # @return [Provider]
    def get_provider(id, opts = {})
      data, _status_code, _headers = get_provider_with_http_info(id, opts)
      data
    end

    # Retrieve a specific provider
    # @param id [String] ID of the provider to return
    # @param [Hash] opts the optional parameters
    # @return [Array<(Provider, Integer, Hash)>] Provider data, response status code and response headers
    def get_provider_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProvidersApi.get_provider ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling ProvidersApi.get_provider"
      end
      # resource path
      local_var_path = '/org/providers/{id}/'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Provider'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKeyAuth']

      new_options = opts.merge(
        :operation => :"ProvidersApi.get_provider",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProvidersApi#get_provider\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
