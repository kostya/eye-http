require 'bundler/setup'
Bundler.require
require 'celluloid'

require 'uri'
require 'net/http'

PORT = 12346

def fixture(name)
  File.expand_path(File.join(File.dirname(__FILE__), 'fixtures', name))
end

class Eye::Controller
  def load2(*args); load(*args); end
end

Eye::Logger.link_logger(File.join(File.dirname(__FILE__), ["spec.log"]))

RSpec.configure do |config|
  config.mock_with :rr

  config.before { Celluloid.boot }
  config.after { Celluloid.shutdown }
end
