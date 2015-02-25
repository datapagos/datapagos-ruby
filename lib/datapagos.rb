require File.expand_path('datapagos/token.rb', File.dirname(__FILE__))
require File.expand_path('datapagos/charge.rb', File.dirname(__FILE__))
require File.expand_path('datapagos/subscription.rb', File.dirname(__FILE__))

# Ruby client of the DataPagos API
module DataPagos
  @base_url = 'https://datapagos.co/api/v1'
  class << self
    attr_accessor :base_url, :public_key, :secret_key
  end

  private
    def self.get(resource)
      uri = URI.parse("#{base_url}#{resource}")
      http = get_http(uri)

      request = Net::HTTP::Get.new(uri.path)
      request.basic_auth public_key, secret_key
      request['Accept'] = 'application/json'

      response = http.request(request)
      parse_json_response(response)
    end

    def self.post(resource, body = {})
      uri = URI.parse("#{base_url}#{resource}")
      http = get_http(uri)

      request = Net::HTTP::Post.new(uri.path)
      request.basic_auth public_key, secret_key
      request['Content-Type'] = 'application/json'
      request['Accept'] = 'application/json'
      request.body = body.to_json

      response = http.request(request)
      parse_json_response(response)
    end

    def self.get_http(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      return http
    end

    def self.parse_json_response(response)
      case response
        when Net::HTTPSuccess
          if response.body && !response.body.strip.empty? then
            JSON.parse(response.body)
          else
            #TODO Make this more readable
            true
          end
        else
          response.error!
      end
    end

end