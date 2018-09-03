class UsersController < ApplicationController
  #this runs an action down in the private section that checks for logged in-ness to edit and update
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
  #makes sure user is not sending edits or creates to another users path
  before_action :correct_user, only: [:edit, :update]
  #make sure user is admin before allowing destroy
  before_action :admin_user, only: [:destroy]
  helper_method :sort_column, :sort_direction

  #this is the users/new page controller the @user variable is passed to the view
  #the User is created using the User class defined in the model
  def new
    @user = User.new
  end

  #this is the controller for the GET request to a users page
  def show
    #the params[:id] is served by the url request
    @user = User.find(params[:id])
    @picks = @user.picks.reorder(sort_column + " " + sort_direction)
  end

  #uses what is POSTed from a user creation form
  def create
    #this used to use params[:user] as the variable, but uses the more secure method
    #defined below in the private section (user_params)
    @user = User.new(user_params)
    if @user.save
      flash.now[:alert] = 'Welcome!'
      log_in(@user)
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.sorted_by_projected_points
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


  ##################################################################

  private


    #this method is to protect params[:user] from being hijacked by a malicious user hash
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


    def sort_column
      Pick.column_names.include?(params[:sort]) ? params[:sort] : "selection"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end







end
