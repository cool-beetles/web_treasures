require "rails_helper"

RSpec.describe AccountsController, type: :controller do 
  describe "as user without account" do
    it "renders the accounts/new template" do
      get :new 
      expect(response).to render_template("accounts/new")
    end

    it "create a new account" do
      post :create, params: { account: { email:"test@test.pl" } }
      expect(assigns(:account)).to be_a_new(Account)
    end
  end
end