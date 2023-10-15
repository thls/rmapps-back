# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user # logged-in users

      if user.is_administrator?
        merge Abilities::Administrator.new(user)
      else
        merge Abilities::Member.new(user)
      end

    else
      merge Abilities::Everyone.new(user)
    end

  end
end
