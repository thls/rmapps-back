class Company < ApplicationRecord
  # Regular expression for CNPJ validation (XX.XXX.XXX/XXXX-XX format)
  CNPJ_REGEX = /\A\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}\z/

  # Presence validations for the cnpj and business_name attributes
  validates_presence_of :cnpj, :business_name

  # Uniqueness validation for the cnpj attribute
  validates_uniqueness_of :cnpj

  # Validate CNPJ format using the regex
  validates_format_of :cnpj, with: CNPJ_REGEX, message: 'is not a valid CNPJ'

  # Define a has_one association with the Address model, and specify dependent: :destroy
  has_one :address, dependent: :destroy

  # Define a has_one_attached association for logo images using Active Storage
  has_one_attached :logo

  # Associations
  has_many :equipment, dependent: :destroy
end
