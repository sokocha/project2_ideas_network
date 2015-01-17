class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all
    else
      # can :read, Idea -- Lisa: will need to update this with chosen levels of permission. Currently everyone is effectively an admin
      can :read, :all
      can :create, Idea
      can :update, Idea do |idea|
        idea.try(:user) == user
      end
    end
  end



end