class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  #protect_from_forgery prepend: true, with: :exception
  protect_from_forgery with: :exception
  
  protected
  def authenticate_user!
    if user_signed_in?
      super
      #redirect_to :controller => "main", :action => "show"; 
    else
      redirect_to login_path, :notice => 'Inicie sesión en Integra...'
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end
end
