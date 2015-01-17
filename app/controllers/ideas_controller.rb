class IdeasController < ApplicationController

  # Lisa: if you remove the except: :index you get stuck in a redirect loop. I believe this is because of the index being the root route.
  load_and_authorize_resource except: :index
  
  # def new
  # end

  # def show
  # end

  def index
    @ideas = Idea.all
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

private
  def idea_params
    params.require(:idea).permit(:title, :description, :category_id, :main_image, :video_link, :feedback_type)
  end

end