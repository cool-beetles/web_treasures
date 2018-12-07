require 'rails_helper'

describe Account, type: :model do
  let(:user)      { User.create(first_name: "ada", last_name: "test") }
  let(:account)   { Account.create(email: "asiunia@asia.com", password_digest: BCrypt::Password.create("tajne567"), user: user) }

  describe "authentication" do

    context "when email and password are correct" do
      it "return account" do
        result = Account.authenticate(account.email, "tajne567")
        expect(result).to eq account
      end
    end

    context "when email is null" do
      it "return nil" do
        result = Account.authenticate(nil, "tajne567")
        expect(result).to eq nil
      end
    end
    
    context "when password is incorrect" do
      it "return nil" do
        result = Account.authenticate(account.email, "tajne")
        expect(result).to eq nil
      end
    end

    context "email doesn't exist in database" do
      it "return nil" do
        result = Account.authenticate("testowane@test.com", "sekretnysekret")
        expect(result).to eq nil
      end
    end
  end
end