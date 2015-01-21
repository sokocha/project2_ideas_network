class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :admin
      can :manage, :all

    elsif user.persisted?
      can :read, :all
      cannot :create, Category
      cannot :destroy, Category
      cannot :update, Category
      can :create, Idea
      can :upvote, Idea
      can :downvote, Idea
      cannot :destroy, Idea       
       
      can :update, Idea do |idea|
        idea.try(:user) == user
      end
      # Not allowed to give an originality score to an idea
      
      can :score_originality, Idea do |idea|
        idea.try(:user_id) != user.id
      end

      can :update, User do |user|
        user.try(:user_id) == user.id
      end

    else
        # what can non-logged-in users do?
        can :read, :all
    end
    
  end
  

end