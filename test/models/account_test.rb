require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def setup
    @account = accounts(:owners_account)
  end

  test "Should return @account if email and password are correct" do
    result = Account.authenticate(@account.email, "secret123")
    assert_equal @account, result
  end

  test "Should return nil if password is incorrect" do
    result = Account.authenticate(@account.email, "secret")
    assert_nil result
  end

  test "Should return nil if email is null" do
    result = Account.authenticate(nil, "secret123")
    assert_nil result
  end

  test "Should return nil if email doesn't exist in database" do
    result = Account.authenticate("test@test.com", "secret123")
    assert_nil result
  end
end
