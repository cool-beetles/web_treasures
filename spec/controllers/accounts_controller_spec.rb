require "rails_helper"

RSpec.describe AccountsController, type: :request do
  it "creates a Account and redirects to the Account's page" do
    get "/register"
    expect(response).to render_template("accounts/new")

    post "/register", params: { account: { email: "test@test12.pl", password: "adunia", password_confirmation: "adunia", user_attributes: { first_name: "Ada", last_name: "Ada" } } }
    expect(response).to redirect_to(treasures_path)
    follow_redirect!
  end

  it "does not render a different template" do
    get "/register"
    expect(response).to_not render_template("sessions/new")
  end
end