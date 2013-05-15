require_relative "test_helper"

class TestTimerEngine < Minitest::Test
  def setup
    @getup = Getup::TimerEngine.new(name: 'foo', 
                                    interval: 10, 
                                    message: 'woot',
                                    repeat: false)
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
