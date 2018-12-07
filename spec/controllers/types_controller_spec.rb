require "rails_helper"

RSpec.describe TypesController, type: :controller do
  describe "as logged user" do
      before do
      user = User.create(first_name:"test",last_name:"test")
      allow_any_instance_of(described_class).to receive(:current_user) {user}
    end

    describe "GET index" do
      it "renders the types/index template" do
        get :index
        expect(response).to render_template("types/index")
      end
    end
  end
end