require "rails_helper"

RSpec.describe TreasuresController, type: :controller do
  describe "as logged user" do
    before do
      user = User.create(first_name:"test",last_name:"test")
      allow_any_instance_of(described_class).to receive(:current_user) {user}
    end
    
    it "renders the treasures/index template" do
      get :index
      expect(response).to render_template("treasures/index")
    end

    it "render treasures#show template" do
      get :show, params: { id: 1 }
      expect(response.staus).to eq(200)
    end

    it "render treasures#new template" do
    end
    
    context "create treasure with valid attributes" do
      it "should save the new story in the database"
      it "should redirect to the treasures#index page"
    end    
    
    context "create treasure with invalid attributes" do
      it "should not save the new story in the database"
      it "should render treasures#new template"
    end
  end

  describe "as guest user" do  
    it "redirect to login page" do
      get :index
      expect(response).to redirect_to(login_path) 
    end
  end
end