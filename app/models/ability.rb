class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all
    else
      # can :read, Idea -- Lisa: will need to update this with chosen levels of permission. Currently everyone is effectively an admin
      can :manage, :all
    end
  end



end