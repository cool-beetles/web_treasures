class SessionsController < ApplicationController
  def new
  end

  def create
    @account = Account.find_by(email: params[:session][:email]) 

    if @account != nil && params[:session][:password_digest] == @account.password_digest
      session[:user_id] = @account.user_id
      flash[:success] = 'You are log in!'
      redirect_to treasures_path
    else      
      flash[:alert] =  'You should have an account'
      redirect_to root_path
    end 
  end

  def destroy
    @account = Account.find_by(user_id: session[:user_id])
    session.destroy
    flash[:success] = 'You are log out!'
    redirect_to root_path
  end
end
