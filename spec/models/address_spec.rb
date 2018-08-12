require 'rails_helper'

describe Address, type: :model do
  describe "validations" do
  
    context "when street, city and zip_code are provided" do
      it "is valid" do
        address = Address.new(street: "Pabla Nerudy", city: "Warszawa", zip_code: "02-981")
        expect(address.valid?).to eq(true)
      end
    end

    context "when only city and zip_code are provided" do
      it "is invalid" do
        address = Address.new(city: "Warszawa", zip_code: "02-981")
        expect(address.invalid?).to eq(true)
      end
    end

    context "when only street and zip_code are provided" do
      it "is invalid" do
        address = Address.new(street: "Pabla Nerudy", zip_code: "02-981")
        expect(address.invalid?).to eq(true)
      end
    end

    context "when zip_code is longer than 7 symbols" do
      it "is invalid" do
        address = Address.new(street: "Pabla Nerudy", city: "Warszawa", zip_code: "23-43443")
        expect(address.invalid?).to eq(true)
      end
    end
  end
end