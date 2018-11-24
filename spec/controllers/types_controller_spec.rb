require "rails_helper"

RSpec.describe TypesController, type: :controller do
  describe "index" do
      before do
      user = User.create(first_name:"test",last_name:"test")
      allow_any_instance_of(described_class).to receive(:current_user) {user}
    end

    it "renders the types/index template" do
      get :index
      expect(response).to render_template("types/index")
    end
  end
end