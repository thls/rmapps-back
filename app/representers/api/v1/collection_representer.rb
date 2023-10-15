module Api::V1::CollectionRepresenter
  include Roar::JSON
  include Representable::JSON::Collection

  items extend: Proc.new { |item|
    # Gets item class
    klass = item[:input].class.name
    # Returns item class representer
    "Api::V1::#{klass}Representer".constantize
  }
end
