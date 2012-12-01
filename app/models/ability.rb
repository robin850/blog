# encoding: utf-8
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 

    if user.admin?
      can :manage, :all
    else
      can :create, Comment
    end

    can :read, :all
  end
end