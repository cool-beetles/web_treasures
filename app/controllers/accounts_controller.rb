class AccountsController < ApplicationController
  def new
    @account = Account.new
    @account.build_user
  end

  def create
    @account = Account.new(params_account)
    if @account.save
      redirect_to treasures_path
    else
      render :new
    end
  end

  private

  def params_account
    params.require(:account).permit(:email, :password, :password_confirmation, user_attributes: [:first_name, :last_name])
  end
end
