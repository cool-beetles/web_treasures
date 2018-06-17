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
    @rental.start_date = Date.today

    if @rental.save
      redirect_to @rental
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
    params.require(:rental).permit(:due_date, :user_id, :treasure_id)
  end
end
