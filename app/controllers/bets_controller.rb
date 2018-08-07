class BetsController < ApplicationController
  before_action :admin_user, only: [:create, :edit, :destroy, :new, :update, :toggle_lock]
  helper_method :sort_column, :sort_direction

  def index
    @user = current_user
    @bet = Bet.new
    @pick = Pick.new
    @bets = Bet.all.order(sort_column + " " + sort_direction)
  end

  def create
    @bet = Bet.new(bet_params)
    if @bet.save
      flash[:success] = "Bet created!"
      redirect_to bets_path
    else
      flash[:danger] = "No bet created!"
      redirect_to bets_path
    end
  end

  def edit
    @bet = Bet.find(params[:id])
  end

  def update
    @bet = Bet.find(params[:id])
    if @bet.update_attributes(bet_params)
      flash[:success] = "Bet updated"
      redirect_to bets_path
    else
      render 'edit'
    end
  end


  def destroy
    @bet = Bet.find_by(id: params[:id])
    bet_deleted = @bet.title
    @bet.destroy
    flash[:success] = "Bet: #{bet_deleted} deleted"
    redirect_to bets_path
  end

  def new
    @bet= Bet.new
  end


  def toggle_lock
    @selected_bets = Bet.where(id: params[:bet_ids])
    @linked_picks = Pick.where(bet_id: params[:bet_ids])
    @selected_bets.each do |bet|
      bet.toggle_lock
    end
    @linked_picks.each do |pick|
      pick.toggle_lock
    end
    redirect_to bets_url
  end




########################################################################


  private

    def bet_params
      params.require(:bet).permit(:title, :benchmark, :locked)
    end


    def sort_column
      Bet.column_names.include?(params[:sort]) ? params[:sort] : "locked"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
