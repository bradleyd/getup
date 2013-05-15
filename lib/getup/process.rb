require "fileutils"
module Getup
  # Getup::Process handles the forking of the timer
  # and pidfile creation and cleanup
  class Process
    def self.fork_me object
      pid = fork do
              STDOUT.sync = true
              object.start
            end

      # no zombies please!
      ::Process.detach(pid)
      write_pidfile pid
    end  

    # @private 
    def self.write_pidfile(pid, pidfile="/tmp/getup.pid")
      File.open(pidfile, 'w') { |f| f.write(pid) }
    end
    
    # @private 
    def self.get_pid_from_file(filename="/tmp/getup.pid")
      begin
        pid = IO.readlines(filename)
      rescue Errno::ENOENT => e
        puts e.message + "---Are you sure it is running?"
        exit 1
      end
      # if the file is there but no pid was written to_i returns 0
      pid.empty? ? -1 : pid[0].to_i
    end
    
    def self.kill_timer(pidfile="/tmp/getup.pid")
      pid = get_pid_from_file(pidfile)
      begin
        ::Process.kill(9,pid)
      rescue Errno::ESRCH => e
        puts e.message
        puts "The pid file may not have been cleaned up properly."
        exit 1
      ensure
        pidfile_cleanup
      end
    end

    # @private 
    def self.pidfile_cleanup(pidfile="/tmp/getup.pid")
      begin
        FileUtils.rm(pidfile)
      rescue Errno::ENOENT => e
        puts e.message
        exit 1
      end
    end  
  end
end
