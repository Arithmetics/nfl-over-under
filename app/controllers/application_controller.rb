class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper




  private #############################################


  def logged_in_user
    #sessions helper that checks if current_user is empty (session user)
    unless logged_in?
      store_location #stores where the person was trying to go when they were logged out so that they can be sent there after login in
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    #sets @user to the url bar user (id)
    @user = User.find(params[:id])
    #checks to see if this matches the session helper which checks the session and the cookies
    redirect_to(root_url) unless current_user?(@user) #same as: @user == current_user
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end




end
