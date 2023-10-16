module Abilities
  class Member
    include CanCan::Ability

    def initialize(user)
      # Inherit permissions from the Everyone role
      merge Abilities::Everyone.new(user)

      # Users
      # All members can view any User's profile
      can :read, User
      # Members can manage (update or delete) their own User profile
      can :manage, User, id: user.id
      # Members cannot create new Users
      cannot :create, User

      # Companies
      # Members can view Companies associated with equipment they own
      can :read, Company, equipment: { user_id: user.id }

      # Equipment
      can [:read, :update], Equipment, responsible_user: user
    end
  end
end
