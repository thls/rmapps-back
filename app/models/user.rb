class User < ApplicationRecord
  # Include Devise JWT Revocation Strategy (JTIMatcher)
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default Devise modules.
  # Others available are: :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :recoverable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  # Define a callback to nullify equipment user_id before destroying the user
  before_destroy :nullify_equipment_user_id

  # Associations
  has_one :administrator, dependent: :destroy
  has_many :equipment

  # Method to check if the user is an administrator
  def is_administrator?
    administrator.present?
  end

  private
    # Callback method to nullify the user_id of associated equipment records before destroying the user
    def nullify_equipment_user_id
      self.equipment.update_all(user_id: nil)
    end
end
