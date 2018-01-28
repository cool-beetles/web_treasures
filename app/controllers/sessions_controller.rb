class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def create
    if @account = Account.authenticate(params[:session][:email], params[:session][:password_digest])
      session[:user_id] = @account.user_id
      flash[:success] = 'You are log in!'
      redirect_to treasures_path
    else
      flash[:alert] =  'You should have an account'
      redirect_to root_path
    end
  end

  def destroy
    session.destroy
    flash[:success] = 'You are log out!'
    redirect_to root_path
  end
end
