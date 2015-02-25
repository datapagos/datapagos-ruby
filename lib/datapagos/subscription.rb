require 'net/http'
require 'net/https'
require 'json'

module DataPagos
  class Subscription
    def self.create(options={})
      DataPagos.post "/subscriptions", options
    end

    def self.show(uid)
      DataPagos.get "/subscriptions/#{uid}"
    end

    def self.cancel(uid)
      DataPagos.post "/subscriptions/#{uid}/cancel"
    end
  end
end