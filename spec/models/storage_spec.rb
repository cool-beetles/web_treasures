require 'rails_helper'

describe Storage, type: :model do
  let(:user)    { User.new(first_name: "John", last_name: "Smith") }
  let(:address) { Address.new(street: "Okragla", city: "Olsztyn", zip_code: "10-900" ) }

  describe "validations" do
    context "when name is provided" do
      it "is valid" do
        storage = Storage.new(owner: user, name: "House", address: address)
        expect(storage.valid?).to eq(true)
      end
    end

    context "when name is longer than 15 letters" do
      it "is invalid" do
        storage = Storage.new(name: "House of my best friends")
        expect(storage.invalid?).to eq(true)
      end
    end

    context "when owner isn't provided" do
      it "is invalid" do
        storage = Storage.new(name: "House", address: address)
        expect(storage.invalid?).to eq(true)
      end
    end
  end
end