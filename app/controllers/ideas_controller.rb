class IdeasController < ApplicationController

  # Lisa: if you remove the except: :index you get stuck in a redirect loop. I believe this is because of the index being the root route.
  load_and_authorize_resource except: :index
  
  # def new
  # end

  # def show
  # end

  # def index
  # end

  # def edit
  # end

  # def update
  # end

  def create
    @idea = Idea.new(idea_params)
    @idea.save
    redirect_to(ideas_path)
  end

private
  def idea_params
    params.require(:idea).permit(:title, :description, :category_id, :main_image, :video_link, :feedback_type)
  end

end
