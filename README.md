# Eye::Http

Http interface for the Eye gem.

## Installation

    gem install eye
    gem install eye-http

## Usage

Example config:

```ruby
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
```

Run:

    bundle exec eye l examples/1.eye

Api:

    curl http://127.0.0.1:12345/api/info?filter=all
    curl -X PUT http://127.0.0.1:12345/api/restart?filter=all
