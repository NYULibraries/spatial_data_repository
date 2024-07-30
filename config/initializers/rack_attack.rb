class Rack::Attack
  # Crawlers, Bots & Troublemakers
  blocklist_ip("47.76.209.138") # Alibaba Cloud HK
  blocklist_ip("47.76.99.127")  # Alibaba Cloud HK
  blocklist_ip("34.211.15.100") # Overly Curious EC2 Instance

  # Throttle all requests by IP (60rpm)
  #
  # Key: "rack::attack:#{Time.now.to_i/:period}:req/ip:#{req.ip}"
  throttle('req/ip', limit: 300, period: 5.minutes) do |req|
    req.ip unless req.path.start_with?('/assets')
  end
end
