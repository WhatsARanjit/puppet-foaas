require 'net/http'
require 'uri'
require 'json'

Puppet::Functions.create_function(:foaas) do

  dispatch :foaas do
    repeated_param 'String', :args
  end

  def foaas(*args)
    url  = "http://foaas.com/#{args.join('/')}"
    uri  = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)

    req           = Net::HTTP::Get.new(uri.request_uri)
    req['Accept'] = 'application/json'
    res           = http.request(req)

    json = JSON.load(res.body)
    msg  = json['message']
    msg += " #{json['subtitle'] if json['subtitle']}"

    msg

  end
end
