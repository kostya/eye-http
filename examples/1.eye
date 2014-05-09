require 'eye-http'

Eye.config do
  http :enable => true, :host => "127.0.0.1", :port => 12345
end

Eye.application :app do
  process :process do
    start_command "sleep 100"
    daemonize true
    pid_file "/tmp/1.pid"
  end
end
