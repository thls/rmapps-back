class User < ApplicationRecord
  # Include Devise JWT Revocation Strategy (JTIMatcher)
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default Devise modules.
  # Others available are: :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :recoverable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  # Associations
  has_one :administrator, dependent: :destroy

  # Method to check if the user is an administrator
  def is_administrator?
    administrator.present?
  end
end
