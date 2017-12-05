require 'test_helper'

class StorageTest < ActiveSupport::TestCase
  test "should save storage with proper name" do 
    storage = Storage.new(name: storages(:house).name)
    assert storage.valid?
  end

  test "should not save storage with name longer than 15 letters" do  
    storage = Storage.new(name: storages(:house_of_friend).name)
    assert_not storage.valid?
    assert_equal [:name], storage.errors.keys
  end
end
