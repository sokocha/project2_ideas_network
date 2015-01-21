class IdeasController < ApplicationController

  load_and_authorize_resource 


  
  # def new
  # end

  def show
    @idea = Idea.find(params[:id])
    @comments = @idea.comment_threads.order('created_at desc')
    # @comment = Comment.build_from(@idea, current_user.id, "")
    #@comment = current_user.comments.new

    if current_user
      @comment = Comment.build_from(@idea, current_user.id, "" )
    end

  end


  def index   
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
    # @idea.save
    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea has been listed.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  def upvote
    @idea = Idea.find(params[:id])
    
    if current_user.send(:liked?, @idea, :vote_scope => 'vote_for_idea')
      @idea.unliked_by current_user, :vote_scope => 'vote_for_idea'
    else
      @idea.liked_by current_user, :vote_scope => 'vote_for_idea'
    end

    render :partial => "ideas/ideascore", locals: { idea: @idea}, layout: false if request.xhr?
  end

  def downvote
    @idea = Idea.find(params[:id])

    if current_user.send(:disliked?, @idea, :vote_scope => 'vote_for_idea')
      @idea.undisliked_by current_user, :vote_scope => 'vote_for_idea'
    else
      @idea.disliked_by current_user, :vote_scope => 'vote_for_idea'
    end

    # @idea.downvote_from current_user, :vote_scope => 'vote_for_idea'

    render :partial => "ideas/ideascore", locals: { idea: @idea}, layout: false if request.xhr?
  end

  def score_originality
    # rescue CanCan::AccessDenied
    #    exception.message
    @idea = Idea.find(params[:id])
    @idea.liked_by current_user, :vote_scope => 'rate_originality', :vote_weight => params[:vote_weight]
    render :template => "ideas/originalityscore", layout: false if request.xhr?
  end


private
  def idea_params
    params.require(:idea).permit(:title, :description, :category_id, :main_image, :video_link, :feedback_type, :idea_image, :remote_idea_image_url)
  end

end