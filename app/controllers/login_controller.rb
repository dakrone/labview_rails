class LoginController < ApplicationController
  before_filter :authorize, :only => [:index]

  def index
    session[:logged_in] = false
    self.authorize
    redirect_to :controller => "machines", :action => "index"
  end

  def logout
    session[:logged_in] = false
    flash[:notice] = "Logged out."
    redirect_to :controller => "machines", :action => "index"
  end

  protected
  def authorize
    if session[:logged_in] == false
      authenticate_or_request_with_http_basic do |username, password|
        user = User.authenticate(username, password)
        unless user.nil?
          session[:logged_in] = true
          session[:user] = user
          return true
        else
          session[:logged_in] = false
          return false
        end
      end
    end
  end

end
