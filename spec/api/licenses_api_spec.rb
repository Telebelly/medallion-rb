require 'spec_helper'
require 'json'

describe 'LicensesApi' do
  before do
    @api_instance = MedallionRb::LicensesApi.new
  end

  describe 'test an instance of LicensesApi' do
    it 'should create an instance of LicensesApi' do
      expect(@api_instance).to be_instance_of(MedallionRb::LicensesApi)
    end
  end

  describe 'list_licenses test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  describe 'get_license test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end
end
