require 'spec_helper'
require 'json'
require 'date'

describe MedallionRb::OrgLicense do
  let(:instance) { MedallionRb::OrgLicense.new }

  describe 'test an instance of OrgLicense' do
    it 'should create an instance of OrgLicense' do
      expect(instance).to be_instance_of(MedallionRb::OrgLicense)
    end
  end

  describe 'build_from_hash' do
    it 'should deserialize from a hash' do
      attributes = {
        id: 'license-123',
        provider: 'provider-456',
        status: 'active',
        state: 'CA',
        license_number: 'A12345',
        expiration_date: '2025-12-31',
        issue_date: '2020-01-01'
      }
      license = MedallionRb::OrgLicense.build_from_hash(attributes)
      expect(license.id).to eq('license-123')
      expect(license.provider).to eq('provider-456')
      expect(license.status).to eq('active')
      expect(license.state).to eq('CA')
      expect(license.license_number).to eq('A12345')
      expect(license.expiration_date).to eq('2025-12-31')
      expect(license.issue_date).to eq('2020-01-01')
    end

    it 'should return nil for non-hash input' do
      expect(MedallionRb::OrgLicense.build_from_hash(nil)).to be_nil
      expect(MedallionRb::OrgLicense.build_from_hash("string")).to be_nil
    end
  end

  describe 'to_hash' do
    it 'should convert to a hash' do
      license = MedallionRb::OrgLicense.new(
        id: 'license-123',
        status: 'active',
        state: 'CA'
      )
      hash = license.to_hash
      expect(hash[:id]).to eq('license-123')
      expect(hash[:status]).to eq('active')
      expect(hash[:state]).to eq('CA')
    end
  end

  describe 'test attribute "id"' do
    it 'should work' do
      instance.id = 'test-id'
      expect(instance.id).to eq('test-id')
    end
  end

  describe 'test attribute "status"' do
    it 'should work' do
      instance.status = 'active'
      expect(instance.status).to eq('active')
    end
  end

  describe 'test attribute "state"' do
    it 'should work' do
      instance.state = 'NY'
      expect(instance.state).to eq('NY')
    end
  end
end
