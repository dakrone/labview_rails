require 'test_helper'

class MachineTest < ActiveSupport::TestCase

  test "create a machine" do
    m = Machine.new(:name => "testmachine", :ip => "127.0.0.1", :user => "testuser", :project => "testproject", :os => "Linux", :password => "test12", :comment => "testcomment")
    assert m.save
  end

  test "retrieve a machine" do
    m = Machine.new(:name => "testmachine", :ip => "127.0.0.1", :user => "testuser", :project => "testproject", :os => "Linux", :password => "test12", :comment => "testcomment")
    m.save
    id = m.id
    assert Machine.find_by_id(id)
  end

  test "change a machine" do
    m = Machine.new(:name => "testmachine", :ip => "127.0.0.1", :user => "testuser", :project => "testproject", :os => "Linux", :password => "test12", :comment => "testcomment")
    m.save
    id = m.id
    assert Machine.find_by_id(id).name == "testmachine"
    m.update_attributes(:name => "testingmachine")
    assert Machine.find_by_id(id).name == "testingmachine"
  end

  test "destroy a machine" do
    m = Machine.new(:name => "testmachine", :ip => "127.0.0.1", :user => "testuser", :project => "testproject", :os => "Linux", :password => "test12", :comment => "testcomment")
    m.save
    id = m.id
    assert m.destroy
    assert !Machine.find_by_id(id)
  end

end
