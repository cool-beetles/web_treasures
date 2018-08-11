require 'rails_helper'

describe Treasure, type: :model do
  let(:user)    { User.new(first_name: "John", last_name: "Smith") }
  let(:type)    { Type.new(name: "books") }
  
  describe "validations" do
    context "when owner, type and title are provided" do
      it "is valid" do
        treasure = Treasure.new(owner: user, type: type, title: "My treasure")
        expect(treasure.valid?).to eq(true)
      end
    end

    context "when owner isn't provided" do
      it "is invalid" do
        treasure = Treasure.new(type: type, title: "My treasure")
        expect(treasure.invalid?).to eq(true)
      end
    end

    context "when type isn't provided" do
      it "is invalid" do
        treasure = Treasure.new(owner: user, title: "My treasure")
        expect(treasure.invalid?).to eq(true)
      end
    end

    context "when title isn't provided" do
      it "is invalid" do
        treasure = Treasure.new(owner: user, type: type)
        expect(treasure.invalid?).to eq(true)
      end
    end
  end
end