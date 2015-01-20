class IdeasController < ApplicationController

  # Lisa: if you remove the except: :index you get stuck in a redirect loop. I believe this is because of the index being the root route.
  load_and_authorize_resource except: :index
  
  # def new
  # end

  # def show
  # end

  def index
    
    @ideas = Idea.paginate(page: params[:page], per_page: 1).order('created_at DESC')

  end

  # def edit
  # end

  def update
    @idea.update(idea_params)
    redirect_to(idea_path)
  end

  def destroy
    @idea.destroy
    redirect_to(ideas_path)
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user_id = current_user.id if current_user
    @idea.save
    redirect_to @idea
  end

  def upvote
    @idea = Idea.find(params[:id])
    @idea.liked_by current_user, :vote_scope => 'vote_for_idea'
    render :template => "ideas/ideascore", layout: false if request.xhr?
  end

  def downvote
    @idea = Idea.find(params[:id])
    @idea.downvote_from current_user, :vote_scope => 'vote_for_idea'
    render :template => "ideas/ideascore", layout: false if request.xhr?
  end

  def score_originality
    @idea = Idea.find(params[:id])
    @idea.liked_by current_user, :vote_scope => 'rate_originality', :vote_weight => params[:vote_weight]
    render :template => "ideas/originalityscore", layout: false if request.xhr?
  end


private
  def idea_params
    params.require(:idea).permit(:title, :description, :category_id, :main_image, :video_link, :feedback_type, :idea_image, :remote_idea_image_url)
  end

end