require 'date'
require 'time'

module MedallionRb
  class OrgProvider
    attr_accessor :id

    attr_accessor :email

    attr_accessor :full_name

    attr_accessor :first_name

    attr_accessor :last_name

    attr_accessor :middle_name

    attr_accessor :suffix

    attr_accessor :profession

    attr_accessor :npi

    attr_accessor :employment_status

    attr_accessor :provider_type

    attr_accessor :specialties

    attr_accessor :date_of_birth

    attr_accessor :ssn_last_four

    attr_accessor :phone_number

    attr_accessor :created_at

    attr_accessor :updated_at

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'email' => :'email',
        :'full_name' => :'full_name',
        :'first_name' => :'first_name',
        :'last_name' => :'last_name',
        :'middle_name' => :'middle_name',
        :'suffix' => :'suffix',
        :'profession' => :'profession',
        :'npi' => :'npi',
        :'employment_status' => :'employment_status',
        :'provider_type' => :'provider_type',
        :'specialties' => :'specialties',
        :'date_of_birth' => :'date_of_birth',
        :'ssn_last_four' => :'ssn_last_four',
        :'phone_number' => :'phone_number',
        :'created_at' => :'created_at',
        :'updated_at' => :'updated_at'
      }
    end

    # Returns attribute mapping this model knows about
    def self.acceptable_attribute_map
      attribute_map
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      acceptable_attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'String',
        :'email' => :'String',
        :'full_name' => :'String',
        :'first_name' => :'String',
        :'last_name' => :'String',
        :'middle_name' => :'String',
        :'suffix' => :'String',
        :'profession' => :'String',
        :'npi' => :'String',
        :'employment_status' => :'String',
        :'provider_type' => :'String',
        :'specialties' => :'Array<String>',
        :'date_of_birth' => :'String',
        :'ssn_last_four' => :'String',
        :'phone_number' => :'String',
        :'created_at' => :'String',
        :'updated_at' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'middle_name',
        :'suffix',
        :'npi',
        :'date_of_birth',
        :'ssn_last_four',
        :'phone_number',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `MedallionRb::OrgProvider` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      acceptable_attribute_map = self.class.acceptable_attribute_map
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `MedallionRb::OrgProvider`. Please check the name to make sure it's valid. List of attributes: " + acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'email')
        self.email = attributes[:'email']
      end

      if attributes.key?(:'full_name')
        self.full_name = attributes[:'full_name']
      end

      if attributes.key?(:'first_name')
        self.first_name = attributes[:'first_name']
      end

      if attributes.key?(:'last_name')
        self.last_name = attributes[:'last_name']
      end

      if attributes.key?(:'middle_name')
        self.middle_name = attributes[:'middle_name']
      end

      if attributes.key?(:'suffix')
        self.suffix = attributes[:'suffix']
      end

      if attributes.key?(:'profession')
        self.profession = attributes[:'profession']
      end

      if attributes.key?(:'npi')
        self.npi = attributes[:'npi']
      end

      if attributes.key?(:'employment_status')
        self.employment_status = attributes[:'employment_status']
      end

      if attributes.key?(:'provider_type')
        self.provider_type = attributes[:'provider_type']
      end

      if attributes.key?(:'specialties')
        if (value = attributes[:'specialties']).is_a?(Array)
          self.specialties = value
        end
      end

      if attributes.key?(:'date_of_birth')
        self.date_of_birth = attributes[:'date_of_birth']
      end

      if attributes.key?(:'ssn_last_four')
        self.ssn_last_four = attributes[:'ssn_last_four']
      end

      if attributes.key?(:'phone_number')
        self.phone_number = attributes[:'phone_number']
      end

      if attributes.key?(:'created_at')
        self.created_at = attributes[:'created_at']
      end

      if attributes.key?(:'updated_at')
        self.updated_at = attributes[:'updated_at']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          email == o.email &&
          full_name == o.full_name &&
          first_name == o.first_name &&
          last_name == o.last_name &&
          middle_name == o.middle_name &&
          suffix == o.suffix &&
          profession == o.profession &&
          npi == o.npi &&
          employment_status == o.employment_status &&
          provider_type == o.provider_type &&
          specialties == o.specialties &&
          date_of_birth == o.date_of_birth &&
          ssn_last_four == o.ssn_last_four &&
          phone_number == o.phone_number &&
          created_at == o.created_at &&
          updated_at == o.updated_at
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, email, full_name, first_name, last_name, middle_name, suffix, profession, npi, employment_status, provider_type, specialties, date_of_birth, ssn_last_four, phone_number, created_at, updated_at].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attributes = attributes.transform_keys(&:to_sym)
      transformed_hash = {}
      openapi_types.each_pair do |key, type|
        if attributes.key?(attribute_map[key]) && attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = nil
        elsif type =~ /\AArray<(.*)>/i
          if attributes[attribute_map[key]].is_a?(Array)
            transformed_hash["#{key}"] = attributes[attribute_map[key]].map { |v| _deserialize($1, v) }
          end
        elsif !attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = _deserialize(type, attributes[attribute_map[key]])
        end
      end
      new(transformed_hash)
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def self._deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        klass = MedallionRb.const_get(type)
        klass.respond_to?(:openapi_any_of) || klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
