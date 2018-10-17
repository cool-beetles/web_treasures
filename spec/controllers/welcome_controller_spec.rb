require "rails_helper"

RSpec.describe WelcomeController, type: :controller do
  describe "index" do
    it "renders the welcome/index template" do
      get :index
      expect(response).to render_template("welcome/index")
      expect(response.body).to eq ""
    end
  end
end