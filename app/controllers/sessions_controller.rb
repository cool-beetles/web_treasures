class SessionsController < ApplicationController
  def new
  end

  def create
    @account = Account.find_by(params[:email]) 

    if @account == @account.password
      session[:user_id] == @account.user_id
      @account.save
      redirect_to root_url
    else
      render :new
    end 
  end
end
