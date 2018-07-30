class RentalsController < ApplicationController
  before_action :require_login

  def index
    @rentals = current_user.rentals
    @lend_rentals = current_user.lend_rentals
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(params_rental)
    @rental.treasure = Treasure.find(params[:treasure_id])
    @rental.start_date = Date.today

    if @rental.save
      redirect_to rentals_path
    else
      render :new
    end
  end

  def update
    @rental = Rental.find(params[:id])
    @rental.return_date = Date.today
    @rental.save
  end

  private

  def params_rental
    params.require(:rental).permit(:due_date, :user_id)
  end
end
