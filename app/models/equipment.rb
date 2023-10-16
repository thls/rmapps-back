class Equipment < ApplicationRecord
  # Associations
  belongs_to :company
  belongs_to :responsible_user, foreign_key: :user_id, class_name: 'User', optional: true

  # Validations
  validates_presence_of :name, :serial_number, :acquisition_date, :company
  validates_uniqueness_of :serial_number, scope: :company
end
