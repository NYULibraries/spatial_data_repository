class Rack::Attack
  # Tighten to 60 requests per 5 minutes
  throttle('req/ip', limit: 60, period: 5.minutes) do |req|
    req.ip unless req.path.start_with?('/assets')
  end

  # Stricter for search requests
  throttle('search/ip', limit: 20, period: 1.minute) do |req|
    req.ip if req.path == '/' && req.query_string.include?('f%5B')
  end

  self.throttled_responder = lambda do |request|
    [429, {'Content-Type' => 'text/plain'}, ["Rate limit exceeded\n"]]
  end
end
