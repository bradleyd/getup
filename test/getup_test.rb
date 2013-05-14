require_relative "test_helper"
require 'timers'
class TestGetup < Minitest::Test
  def setup
    @getup = Getup::Timer.new(timer_lib: Timers.new, 
                              name: 'foo', 
                              interval: 1, 
                              message: 'woot')
  end

  def test_schedule_responds_to_start
    assert_respond_to @getup, :start
  end

  def test_schedule_responds_to_stop
    assert_respond_to @getup, :stop
  end

  def test_schedule_responds_to_pause
    assert_respond_to @getup, :pause
  end

  def test_schedule_responds_to_resume
    assert_respond_to @getup, :resume
  end

  def test_timer_is_started
    assert_equal @getup.start, "timer started"
  end

end
