class RentalsController < ApplicationController
  before_action :require_login

  def new
  	@rental = Rental.new
  end

  def create
  	@rental = Rental.new(params_rental)

  	if @rental.save
  		redirect_to treasures_path
  	else
  	  render :new
  	end
  end

  private

  def params_rental
  	params.require(:rental).permit(:due_date, :user_id, :treasure_id)
  end
end
