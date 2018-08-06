require 'rails_helper'

describe Type, type: :model do
  describe "validations" do
  
    context "when name is provided" do
      it "is valid" do
        type = Type.new(name: "Books")
        expect(type.valid?).to eq(true)
      end
    end

    context "when name is longer than 10 letters" do
      it "is invalid" do
        type = Type.new(name: "Books from library")
        expect(type.invalid?).to eq(true)
      end
    end
  end
end