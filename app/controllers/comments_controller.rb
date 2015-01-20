class CommentsController < ApplicationController
  before_action :set_comment, except: [:new, :create]
  before_action :set_idea

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.build_from(@idea, current_user.id, params[:comment][:body])
    # @comment.title = params[:comment][:title] 

    if @comment.save
      redirect_to @idea
    else
      render :js => "alert('error saving comment');"
    end
  end

  def destroy
    if @comment.destroy
      render :json => @comment, :status => :ok
    else
      render :js => "alert('error deleting comment');"
    end
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_idea
    @idea = Idea.find(params[:idea_id])
  end

  def prepare_new_comment
    @comment = Comment.new(commentable_id: @idea.id, commentable_type: @idea.constantize)
  end

  def comment_params
    params.require(:comment).permit(:title, :body, :commentable_id, :commentable_type)
  end
  
end