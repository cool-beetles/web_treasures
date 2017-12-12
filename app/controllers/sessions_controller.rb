class SessionsController < ApplicationController
  def new
  end

  def create
    @account = Account.find_by(email: params[:session][:email]) 

    if @account == Account.find_by(password: params[:session][:password])
      session[:user_id] = @account.user_id
      @account.save
      flash[:success] = 'You are log in!'
      redirect_to treasures_path
    else
      flash[:alert] =  'You should have an account'
      redirect_to root_path
    end 
  end

  def destroy
    @account = Account.find_by(user_id: session[:user_id])
    @account.destroy
    flash[:success] = 'You are log out!'
    redirect_to root_path
  end
end
