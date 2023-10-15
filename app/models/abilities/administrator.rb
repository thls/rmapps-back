module Abilities
  class Administrator
    include CanCan::Ability

    def initialize(user)
      merge Abilities::Member.new(user)

      can :manage, User
    end

  end
end
