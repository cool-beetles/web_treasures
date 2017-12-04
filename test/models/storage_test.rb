require 'test_helper'

class StorageTest < ActiveSupport::TestCase
  test "should not save storage with too long name" do 
    storage = Storage.new(name: "My house")
    assert_not storage.invalid?

    storage = Storage.new(name: "House of my friend Emily")
    assert_not storage.valid?
  end
end
