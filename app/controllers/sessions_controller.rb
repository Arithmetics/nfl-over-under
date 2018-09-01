class SessionsController < ApplicationController

  def new
  end



  def create
    #find user in database by email
    user = User.find_by(email: params[:session][:email].downcase)
    #if user is in database and if the authenticate(automatic AR method) method returns true
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        #this is a method sitting in the sessions_helper it sets the session hash to the users id
        log_in(user)
        #pulls in results from checkbox, remember and forget user are from session helper
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        #the redirect_back_or is the sessions helper saying go where they were trying to go
        #or if they werent just go to the user profile
        redirect_back_or root_url #same as redirect_to user_url(user) thru rails magic
      else
        flash[:warning] = "Account not activated, check your email. Send to #{user.email}"
        redirect_to root_url
      end 
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    #clear session hash of user id
    log_out if logged_in?
    redirect_to root_url
  end
end
