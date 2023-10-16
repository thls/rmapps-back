module Api::V1::CompanyRepresenter
  include Roar::JSON

  property :cnpj
  property :business_name
end
