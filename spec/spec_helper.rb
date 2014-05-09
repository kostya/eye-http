require 'bundler/setup'
Bundler.require

require 'uri'
require 'net/http'

PORT = 12346

def fixture(name)
  File.expand_path(File.join(File.dirname(__FILE__), 'fixtures', name))
end

Eye::Logger.link_logger(File.join(File.dirname(__FILE__), ["spec.log"]))

RSpec.configure do |config|
  config.mock_with :rr

  config.before { Celluloid.boot }
  config.after { Celluloid.shutdown }
end
