class PicksController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy]
before_action :correct_user, only: :destroy
helper_method :sort_column, :sort_direction

  def new
    @bets = Bet.all
    @pick = Pick.new
  end

  def create
    if current_user.picks.count > 9
      flash[:danger] = "You are at 10 picks already, please remove a pick to add another!"
      redirect_to bets_url
    elsif params[:pick][:super] == "true" && current_user.picks.where(super: true).count > 4
      flash[:danger] = "You are at 5 Super Picks already, please remove a super pick to add another!"
      redirect_to bets_url
    elsif current_user.picks.find_by_bet_id(params[:pick][:bet_id])
      flash[:danger] = "You have already picked this team once. Pick some other teams!"
      redirect_to bets_url
    else
      @pick = current_user.picks.build(pick_params)
      if @pick.save
        flash[:success] = "Pick saved!"
        redirect_to bets_url
      else
        flash[:danger] = "Pick not saved, something happened"
        redirect_to bets_url
      end
    end
  end

  def destroy
    if !@pick.locked?
      @pick.destroy
      flash[:success] = "Pick deleted"
      redirect_to request.referrer || root_url
    else
      flash[:danger] = "Pick is locked, sorry!"
      redirect_to user_url
    end
  end

  def index
    @picks = Pick.order(sort_column + " " + sort_direction)
    @users = User.all
  end






 ###########################################################

  private

    def pick_params
      params.require(:pick).permit(:title, :benchmark, :locked, :super, :bet_id,
                                   :user_id, :selection)
    end

    def correct_user
      @pick = current_user.picks.find_by(id: params[:id])
      redirect_to root_url if @pick.nil?
    end


    def sort_column
      Pick.column_names.include?(params[:sort]) ? params[:sort] : "user_id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end





end
