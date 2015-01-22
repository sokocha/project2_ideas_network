module IdeasHelper

  def selected_or_unselected_depending_on_user_vote(direction, idea)
    liking_method = case direction
      when :up then :liked?
      when :down then :disliked?
    end  
    # when a user isn't logged in, i.e. no current user, then the triangles both need to have the unselected class. That would mean that this helper has to remove that unselected class.
    if current_user
      current_user.send(liking_method, idea, :vote_scope => 'vote_for_idea') ? "arrow-#{direction}-selected" : "arrow-#{direction}-unselected"
    end
  end

  def voted_state(idea)
    
    if current_user
      did_user_vote = current_user.voted_as_when_voted_for(idea, :vote_scope => 'vote_for_idea')
      {
        true   => "upvoted",
        false  => "downvoted",
      }[did_user_vote] || "not_voted"
    end 

  end


end
