require 'cuba'
require 'json'

Eye::Http::Router = Cuba.new do
  def json(result)
    res.headers['Content-Type'] = 'application/json; charset=utf-8'
    res.write({ result: result }.to_json)
  end

  on root do
    res.write Eye::ABOUT
  end

  [:info_data, :short_data, :debug_data, :history_data].each do |act|
    on "api/#{act.to_s.gsub(/_data$/, '')}", param("filter") do |filter|
      json Eye::Control.command(act, filter)
    end
  end

  [:start, :stop, :restart, :delete, :unmonitor, :monitor].each do |act|
    on put, "api/#{act}", param("filter") do |filter|
      json Eye::Control.command(act, filter)
    end
  end
end
