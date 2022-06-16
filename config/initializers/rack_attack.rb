Rack::Attack.throttle("requests by ip", limit: ENV.fetch("MAX_REQUESTS_PER_MINUTE", "10").to_i, period: 60) do |request|
  request.ip
end
