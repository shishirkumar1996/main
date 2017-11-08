require 'test_helper'

class GroupTest < ActiveSupport::TestCase

  def setup
    @group = Group.new(name: "Example Group")
  end

  test "should be valid" do
    assert @group.valid?
  end

  test "name should be present" do
    @group.name = "     \n\t\n"
    assert_not @group.valid?
  end

  test "name should not be too long" do
    @group.name = "a"*51
    assert_not @group.valid?
    @group.name = " "*20 + "a"*50
    assert @group.valid?
  end

end
