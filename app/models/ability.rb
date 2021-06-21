# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 

    if user.id == 1
      can :manage, Brand
      can :manage, Category
      can :manage, Rent
      can :manage, Service
      can :manage, User
      can :manage, Vehicle

      # can :manage, Category
      can [:index, :create, :update, :show], Category
      # cannot :destroy, Category
      # can :toggle_admin, :administrator
    else
      can :create, Rent
      can :index, Rent
      can :index, Vehicle

      can :read, User, :id => user.id
      can :update, User, :id => user.id
    end
  end
end
