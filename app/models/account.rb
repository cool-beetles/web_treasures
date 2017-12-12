class Account < ApplicationRecord
  has_secure_password
  belongs_to :user
  accepts_nested_attributes_for :user
  validates :email, uniqueness: true

  def self.authenticate(email, password)
    @account = Account.find_by(email: email) 
    if @account != nil && @account.authenticate(password)
      @account
    else
      nil
    end
  end
end
