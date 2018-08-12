require 'rails_helper'

describe Treasure, type: :model do
  let(:user)    { User.new(first_name: "John", last_name: "Smith") }
  let(:type)    { Type.new(name: "books") }
  let(:treasure)    { Treasure.new(owner: user, type: type, title: "My treasure") }
  
  describe "validations" do
    context "when user, treasure are provided" do
      it "is valid" do
        rental = Rental.new(user: user, treasure: treasure)
        expect(rental.valid?).to eq(true)
      end
    end

    context "when user isn't provided" do
      it "is invalid" do
        rental = Rental.new(treasure: treasure)
        expect(rental.invalid?).to eq(true)
      end
    end

    context "when treasure isn't provided" do
      it "is invalid" do
        rental = Rental.new(user: user)
        expect(rental.invalid?).to eq(true)
      end
    end
  end
end

