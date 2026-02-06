require 'cgi'

module MedallionRb
  class LicensesApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # List licenses (paginated)
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return per page
    # @option opts [Integer] :offset The initial index from which to return the results
    # @option opts [String] :ordering Which field to use when ordering the results
    # @option opts [String] :search A search term
    # @option opts [String] :status Filter by license status
    # @option opts [String] :state Filter by state
    # @option opts [String] :provider Filter by provider ID
    # @return [PaginatedOrgLicenseList]
    def list_licenses(opts = {})
      data, _status_code, _headers = list_licenses_with_http_info(opts)
      data
    end

    # List licenses (paginated)
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return per page
    # @option opts [Integer] :offset The initial index from which to return the results
    # @option opts [String] :ordering Which field to use when ordering the results
    # @option opts [String] :search A search term
    # @option opts [String] :status Filter by license status
    # @option opts [String] :state Filter by state
    # @option opts [String] :provider Filter by provider ID
    # @return [Array<(PaginatedOrgLicenseList, Integer, Hash)>] PaginatedOrgLicenseList data, response status code and response headers
    def list_licenses_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: LicensesApi.list_licenses ...'
      end
      # resource path
      local_var_path = '/org/licenses/'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'ordering'] = opts[:'ordering'] if !opts[:'ordering'].nil?
      query_params[:'search'] = opts[:'search'] if !opts[:'search'].nil?
      query_params[:'status'] = opts[:'status'] if !opts[:'status'].nil?
      query_params[:'state'] = opts[:'state'] if !opts[:'state'].nil?
      query_params[:'provider'] = opts[:'provider'] if !opts[:'provider'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'PaginatedOrgLicenseList'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKeyAuth']

      new_options = opts.merge(
        :operation => :"LicensesApi.list_licenses",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LicensesApi#list_licenses\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Retrieve a specific license
    # @param id [String] ID of the license to return
    # @param [Hash] opts the optional parameters
    # @return [OrgLicense]
    def get_license(id, opts = {})
      data, _status_code, _headers = get_license_with_http_info(id, opts)
      data
    end

    # Retrieve a specific license
    # @param id [String] ID of the license to return
    # @param [Hash] opts the optional parameters
    # @return [Array<(OrgLicense, Integer, Hash)>] OrgLicense data, response status code and response headers
    def get_license_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: LicensesApi.get_license ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling LicensesApi.get_license"
      end
      # resource path
      local_var_path = '/org/licenses/{id}/'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

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
      return_type = opts[:debug_return_type] || 'OrgLicense'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['ApiKeyAuth']

      new_options = opts.merge(
        :operation => :"LicensesApi.get_license",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LicensesApi#get_license\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
