# For most instances we recommend using: CPU cores + 1 = unicorn workers. So for a machine with 2 cores, 3 unicorn workers is ideal.
# For all machines that have 2GB and up we recommend a minimum of three unicorn workers.
# If you have a 1GB machine we recommend to configure only two Unicorn workers to prevent excessive swapping.
# c.f. https://docs.gitlab.com/ee/install/requirements.html#unicorn-workers
worker_processes Integer(ENV['WEB_CONCURRENCY'] || 3)
timeout 15
preload_app true

listen Integer(ENV['UNICORN_PORT'] || 9000)
pid String(ENV['UNICORN_PID'] || '/tmp/unicorn.pid')

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end

