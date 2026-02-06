require 'spec_helper'
require 'json'
require 'date'

describe MedallionRb::Provider do
  let(:instance) { MedallionRb::Provider.new }

  describe 'test an instance of Provider' do
    it 'should create an instance of Provider' do
      expect(instance).to be_instance_of(MedallionRb::Provider)
    end
  end

  describe 'build_from_hash' do
    it 'should deserialize from a hash' do
      attributes = {
        id: 'abc-123',
        email: 'provider@example.com',
        full_name: 'Jane Doe',
        first_name: 'Jane',
        last_name: 'Doe',
        npi: '1234567890',
        employment_status: 'active'
      }
      provider = MedallionRb::Provider.build_from_hash(attributes)
      expect(provider.id).to eq('abc-123')
      expect(provider.email).to eq('provider@example.com')
      expect(provider.full_name).to eq('Jane Doe')
      expect(provider.first_name).to eq('Jane')
      expect(provider.last_name).to eq('Doe')
      expect(provider.npi).to eq('1234567890')
      expect(provider.employment_status).to eq('active')
    end

    it 'should return nil for non-hash input' do
      expect(MedallionRb::Provider.build_from_hash(nil)).to be_nil
      expect(MedallionRb::Provider.build_from_hash("string")).to be_nil
    end
  end

  describe 'to_hash' do
    it 'should convert to a hash' do
      provider = MedallionRb::Provider.new(
        id: 'abc-123',
        first_name: 'Jane',
        last_name: 'Doe'
      )
      hash = provider.to_hash
      expect(hash[:id]).to eq('abc-123')
      expect(hash[:first_name]).to eq('Jane')
      expect(hash[:last_name]).to eq('Doe')
    end
  end

  describe 'test attribute "id"' do
    it 'should work' do
      instance.id = 'test-id'
      expect(instance.id).to eq('test-id')
    end
  end

  describe 'test attribute "email"' do
    it 'should work' do
      instance.email = 'test@example.com'
      expect(instance.email).to eq('test@example.com')
    end
  end

  describe 'test attribute "npi"' do
    it 'should work' do
      instance.npi = '1234567890'
      expect(instance.npi).to eq('1234567890')
    end
  end
end
