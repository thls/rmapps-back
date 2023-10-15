module Abilities
  class Member
    include CanCan::Ability

    def initialize(user)
      merge Abilities::Everyone.new(user)

      can :read, User
      can :manage, User, id: user.id
      cannot :create, User
    end

  end
end
