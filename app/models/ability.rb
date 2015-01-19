class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all
    else
      # add if persisted
      can :read, :all
      cannot :create, Category
      cannot :destroy, Category
      cannot :update, Category
      can :create, Idea
      can :upvote, Idea
      can :downvote, Idea
      can :score_originality, Idea
      cannot :destroy, Idea        
      can :update, Idea do |idea|
        idea.try(:user) == user
      end
      # can :update, User do |user|
      #   user.try(:user) == user
      # end
      
    end
  end



end