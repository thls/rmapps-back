module Abilities
  class Member
    include CanCan::Ability

    def initialize(user)
      # Imports permissions for anyone
      merge Abilities::Everyone.new(user)

      # All members can read any User
      can :read, User
      # Only can manage a User if it's self
      can :manage, User, id: user.id
      # Can't create a User
      cannot :create, User
    end

  end
end
