module Abilities
  class Administrator
    include CanCan::Ability

    def initialize(user)
      # Imports all Member abilities
      merge Abilities::Member.new(user)

      # Can manage all Users
      can :manage, User
    end

  end
end
