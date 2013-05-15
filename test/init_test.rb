require_relative "test_helper"

class TestInit
  def setup
    @getup  = Getup::Init.new
  end

  def test_init_should_respond_to_run
    assert_respond_to @getup, :run
  end
end
