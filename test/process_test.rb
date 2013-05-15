require_relative "test_helper"

class TestProcess < MiniTest::Test
  def setup
    @getup  = Getup::Init.new(name: 'foo', 
                              interval: 10, 
                              message: 'woot',
                              repeat: true)
 
  end

  def test_process_should_respond_to_fork_me
    assert_respond_to Getup::Process, :fork_me
  end

  def test_fork_me_writes_pid
    @getup.run
    assert File.exists?("/tmp/getup.pid")
    Getup::Process.kill_timer
  end

  def test_kill_timer
    @getup.run
    Getup::Process.kill_timer
    refute File.exists?("/tmp/getup.pid")
  end


end
