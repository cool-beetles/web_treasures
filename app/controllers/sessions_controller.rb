class SessionsController < ApplicationController
  def new
  end

  def create
    @account = Account.find_by(email: params[:session][:email]) 

    if @account == Account.find_by(password: params[:session][:password])
      session[:user_id] = @account.user_id
      @account.save
      redirect_to treasures_path
    else
      redirect_to root_path
    end 
  end
end
