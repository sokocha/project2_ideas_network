class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html{ redirect_to root_path, alert: "You can't access this page, please sign in or register" }
      # when you are unable to access the controller action, in this case we received a js format request and the way we'll respond to it is as below. Render this view and tell the browser the reponse is a 403. Because before it was rendering a 200 which translates to success, so it 
      format.js { render 'application/permission_denied', status: 403 }
    end
  end

  before_filter :set_search
  def set_search
    @q = Idea.ransack(params[:q])
    @ideas = @q.result(distinct: true)
    @ideas = @q.result.paginate(page: params[:page], per_page: 10).order('created_at DESC')
  end

end
