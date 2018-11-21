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
  end

  describe "as guest user" do  
    it "redirect to login template" do
      get :index
      expect(response).to redirect_to(login_path) 
    end
  end
end
