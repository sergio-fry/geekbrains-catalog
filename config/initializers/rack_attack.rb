Rack::Attack.throttle("requests by ip", limit: ENV.fetch("MAX_REQUESTS_PER_MINUTE", "1000").to_i, period: 120) do |request|
  request.ip
end
