# mProxy
# based on https://github.com/jaswope/rack-reverse-proxy
# 2013/03/10



require 'rack/reverse_proxy'

use Rack::ReverseProxy do 
  # Set :preserve_host to true globally 
  #(default is true already)
  
  reverse_proxy_options :preserve_host => true


  # conditionals and re-routing here
  
  # to  API
  # localhost/i/discover

  reverse_proxy /^\/i(\/.*)$/, 'http://twitter.com'

  # to http://example.com/test*

  reverse_proxy '/example', 'http://example.com/'



end

app = proc do |env|
  [ 200, {'Content-Type' => 'text/plain'}, "b" ]
end
run app