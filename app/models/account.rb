class Account < ApplicationRecord
  has_secure_password
  belongs_to :user

  def self.authenticate(email, password)
    @account = Account.find_by(email: email) 
    if @account != nil && @account.authenticate(password)
      @account
    else
      nil
    end
  end
end
