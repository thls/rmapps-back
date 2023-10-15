class Company < ApplicationRecord
  # Regular expression for CNPJ validation
  CNPJ_REGEX = /\A\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}\z/

  # Validate CNPJ format using the regex
  validates_presence_of :cnpj, :business_name
  validates_uniqueness_of :cnpj
  validates_format_of :cnpj, with: CNPJ_REGEX, message: 'is not a valid CNPJ'
end
