module Abilities
  class Administrator
    include CanCan::Ability

    def initialize(user)
      # Imports all Manager abilities
      merge Abilities::Manager.new(user)

      # Can manage all Users
      can :manage, User
    end

  end
end
