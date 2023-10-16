module Api::V1::EquipmentRepresenter
  include Roar::JSON

  property :id
  property :acquisition_date
  property :name
  property :serial_number
  property :company, extend: Api::V1::CompanyRepresenter
  property :responsible_user, extend: Api::V1::UserRepresenter
end
