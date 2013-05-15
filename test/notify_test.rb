require_relative "test_helper"


class TestNotify < Minitest::Test

  def setup
    @notify = Getup::Notify.new
  end
  
  def test_notify_responds_to_show
    assert_respond_to @notify, :show
  end

  def test_show_returns_true
    assert @notify.show
  end
end
