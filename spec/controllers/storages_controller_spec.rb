require "rails_helper"

RSpec.describe StoragesController, type: :controller do
  describe "only logged user" do
    before do
      user = User.create(first_name:"test",last_name:"test")
      allow_any_instance_of(described_class).to receive(:current_user) {user}
    end

    it "renders the storages#index template" do 
      get :index
      expect(response).to render_template("storages/index")
    end

    it "renders the storages#new template" do
      get :new
      expect(response).to render_template("storages/new")
    end

    it "create a new storages with valid attributes" do
      post :create, params: { storage: { name: "test" } }
      expect(response.content_type).to eq "text/html"
    end

    it "should redirect to the storages#show page" do
      storage = Storage.first
      get :show, params: { id: storage.id }
      expect(response).to render_template("storages/show")
    end

    it "update existing storage" do
      storage = Storage.first
      put :update, params: { id: storage.id, storage: { name: "test123" } }
      expect(assigns(:storage)).to eq(storage)
    end

    it "destroy old storage" do
      storage = Storage.first
      delete :destroy, params: { id: storage.id }
      expect(response).to redirect_to(storages_path)
    end
  end

  describe "as guest user" do
    it "renders to storages#index template" do
      get :index
      expect(response).to redirect_to(login_path)
    end
  end
end