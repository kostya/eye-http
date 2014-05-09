Eye::Dsl::ConfigOpts
class Eye::Dsl::ConfigOpts
  create_options_methods([:http], Hash)
end

Eye::Controller
class Eye::Controller
  def set_opt_http(params = {})
    if params[:enable]
      if @http
        if params[:host] != @http.host || params[:port].to_i != @http.port
          stop_http
          start_http(params[:host], params[:port])
        end
      else
        start_http(params[:host], params[:port])
      end
    else
      stop_http if @http
    end
  end

private

  def stop_http
    if @http
      @http.stop
      @http = nil
    end
  end

  def start_http(host, port)
    require_relative 'http'
    @http = Eye::Http.new(host, port)
    @http.start
  end
end
