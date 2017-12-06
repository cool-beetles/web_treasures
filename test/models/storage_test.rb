require 'test_helper'

class StorageTest < ActiveSupport::TestCase
  test "should save storage with proper name" do 
    storage = storages(:house)
    assert storage.valid?
  end

  test "should not save storage with name longer than 15 letters" do  
    storage = Storage.new(name: "House of my friend Emily")
    assert_not storage.valid?
    assert_equal [:name], storage.errors.keys
  end
end
