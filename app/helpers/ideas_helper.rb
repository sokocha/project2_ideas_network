module IdeasHelper

  def selected_or_unselected_depending_on_user_vote(direction, idea)
    liking_method = case direction
      when :up then :liked?
      when :down then :disliked?
    end
    if current_user
    current_user.send(liking_method, idea, :vote_scope => 'vote_for_idea') ? "arrow-#{direction}-selected" : "arrow-#{direction}-unselected"
  end
  end


end
