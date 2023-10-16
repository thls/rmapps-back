module Abilities
  class Administrator
    include CanCan::Ability

    def initialize(user)
      # Inherit abilities from the Member role
      merge Abilities::Member.new(user)

      # Users
      # Administrators can manage all Users
      can :manage, User

      # Companies
      # Administrators can manage all Companies
      can :manage, Company

      # Equipment
      # Administrators can manage all Equipment
      can :manage, Equipment
    end
  end
end
