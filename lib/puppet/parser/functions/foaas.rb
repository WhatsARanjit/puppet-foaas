require 'net/http'
require 'uri'
require 'json'

module Puppet::Parser::Functions
  newfunction(:foaas, :type  => :rvalue, :arity => -2) do |arg|

    url  = "http://foaas.com/#{arg.join('/')}"
    uri  = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)

    req           = Net::HTTP::Get.new(uri.request_uri)
    req['Accept'] = 'application/json'
    res           = http.request(req)

    JSON.load(res.body)['message']
  end
end
