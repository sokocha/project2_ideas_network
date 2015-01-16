class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all
    else
      # Lisa: should specify actions here that a normal user is allowed to do
      # can :read, Idea
    end
  end



end