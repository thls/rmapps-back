class Address < ApplicationRecord
  # Regular expression to validate CEP format (XXXXX-XXX)
  CEP_REGEX = /\A\d{5}-\d{3}\z/

  # Presence validations for various attributes
  validates_presence_of :cep, :state, :city, :district, :street, :number

  # Uniqueness validation for the company_id attribute
  validates_uniqueness_of :company_id

  # Validate the CEP format using a regular expression
  validates_format_of :cep, with: CEP_REGEX, message: 'is not in a valid CEP'

  # Define a belongs_to association with the Company model
  belongs_to :company
end
