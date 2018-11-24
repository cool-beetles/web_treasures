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

    context "create treasure with valid attributes" do
      it "should save the new story in the database" do
        post :create, params: { treasure: { title:"test123" } }
        expect(response.status).to eq(200)
      end

      it "should redirect to the treasures#show page" do
        treasure = Treasure.first
        get :show, params: { id: treasure.id }
        expect(response.status).to render_template("treasures/show")
      end
    end    
    
    context "create treasure with invalid attributes" do
      it "should not save the new story in the database" do
        post :create, params: { treasure: { type_id: "test123" } }
        expect(assigns(:treasure)).to be_a_new(Treasure)
      end

      it "should render treasures#new template" do
      	get :new
        expect(response).to render_template("treasures/new")
      end
    end
  end

  describe "as guest user" do  
    it "redirect to login page" do
      get :index
      expect(response).to redirect_to(login_path) 
    end

    it "render treasures#new template" do
      get :new
      expect(response).to redirect_to(login_path)
    end

    it "render treasures#show template" do
      get :show, params: { id: 0 }
      expect(response).to redirect_to(login_path)
    end
  end
end