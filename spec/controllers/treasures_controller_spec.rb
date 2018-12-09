require "rails_helper"

RSpec.describe TreasuresController, type: :controller do
  describe "as logged user" do
    before do
      user = User.create(first_name:"test",last_name:"test")
      allow_any_instance_of(described_class).to receive(:current_user) {user}
    end

    describe "GET index" do
      it "renders the treasures/index template" do
        get :index
        expect(response).to render_template("treasures/index")
      end
    end

    describe "GET new" do
      it "renders the treasures/new template" do
        get :new
        expect(response).to render_template("treasures/new")
      end
    end

    describe "POST create" do
      context "create treasure with valid attributes" do
        let(:type) { Type.create(name: "toys") }

        it "should save the new treasure in the database" do
          expect{ post :create, params: { treasure: { title:"test123", type_id: type.id } } }
            .to change{Treasure.count}.by(1)
        end

        it "should redirect to the treasures#show page" do
          post :create, params: { treasure: { title:"test123", type_id: type.id } }
          created_treasure = Treasure.last
          expect(response).to redirect_to(treasure_path(created_treasure.id))
        end
      end    
      
      context "create treasure with invalid attributes" do
        it "should not save the new treasure in the database" do
          expect{ post :create, params: { treasure: { type_id: "test123" } } }
            .to change{Treasure.count}.by(0)
        end

        it "should render treasures#new template" do
          post :create, params: { treasure: { type_id: "test123" } }
          expect(response).to render_template("treasures/new")
        end
      end
    end

    context "update existing treasure" do
      it "save treasure" do
        type = Type.first
        user = User.first
        treasure = Treasure.create(type: type, owner: user, title: "my title")
        put :update, params: { id: treasure.id, treasure: { title: "changed title" } }
        expect(treasure.reload.title).to eq("changed title")
      end

      it "should render treasures#trash page" do
        get :index
        expect(response).to render_template("treasures/index")
      end
    end

    it "destroy useless treasure" do
      treasure = Treasure.first
      delete :destroy, params: { id: treasure.id }
      expect(response).to redirect_to(treasures_path)
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

    it "redner treasures#edit template" do
      get :edit, params: { id: 0 }
      expect(response).to redirect_to(login_path)
    end
  end
end