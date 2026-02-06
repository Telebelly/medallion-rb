# Common files
require 'medallion-rb/api_client'
require 'medallion-rb/api_error'
require 'medallion-rb/version'
require 'medallion-rb/configuration'

# Models
require 'medallion-rb/models/org_provider'
require 'medallion-rb/models/provider'
require 'medallion-rb/models/org_license'
require 'medallion-rb/models/paginated_org_provider_list'
require 'medallion-rb/models/paginated_org_license_list'

# APIs
require 'medallion-rb/api/providers_api'
require 'medallion-rb/api/licenses_api'

module MedallionRb
  class << self
    # Customize default settings for the SDK using block.
    #   MedallionRb.configure do |config|
    #     config.api_key = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
