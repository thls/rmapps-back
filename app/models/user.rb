class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  # Associations
  has_one :administrator, dependent: :destroy
  has_one :manager, dependent: :destroy

  def is_administrator?
    administrator.present?
  end

end
