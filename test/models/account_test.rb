require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def setup
    @account = accounts(:owners_account)
    @email = @account.email
    @password = "secret123"
  end

  test "Should return @account if email and password are correct" do
    result = Account.authenticate(@email, @password)
    assert_equal @account, result
  end

  test "Should return nil if password is incorrect" do
    @password = "secret"
    result = (Account.authenticate(@email, @password))
    assert_nil result
  end

  test "Should return nil if email is null" do
    @email = nil
    result = Account.authenticate(@email, @password)
    assert_nil result
  end

  test "Should return nil if email doesn't exist in database" do
    @email = "test@test.com"
    result = Account.authenticate(@email, @password)
    assert_nil result
  end
end
