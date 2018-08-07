module SessionsHelper

  #Logs in the given user
  def log_in(user)
    session[:user_id] = user.id #session is not defined in the project it's just a thing you can use
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def remember(user)
    #accesses the remember method in the user model, triggering off the creation of a token and digest in the db
    user.remember
    #makes a cookies that lasts and is encrypted stores user id and the remember_token in it
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  #removes the cookie and deletes the user_digest in the db
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  #returns current logged in user
  #takes the user id in the session(browser) and sends it to the db to find a
  #user with the same id. only does this if it already hasn't/@current_user isn't empty
  def current_user
    if session[:user_id] #if session exists
      @current_user ||= User.find_by(id: session[:user_id])
    elsif cookies.signed[:user_id] #if cookies have a user_id
      user = User.find_by(id: cookies.signed[:user_id]) #find by that user id
      if user && user.authenticated?(:remember, cookies[:remember_token]) #checks database to match remember_token and its digest
         log_in user #creates the sessions
        @current_user = user
      end
    end
  end

  #gives a quick way to check if given user matches current user (in session or cookie)
  def current_user?(user)
    user == current_user
  end



  #returns true if user is logged in, false otherwise
  # sees in @current_user variable is full or not
  def logged_in?
    !current_user.nil?
  end



  #redirects to stored location (or the default)
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end




end
