require 'net/http'
require 'net/https'
require 'json'

module DataPagos
  class Charge
    def self.create(options={})
      DataPagos.post "/charges", options
    end

    def self.show(uid)
      DataPagos.get "/charges/#{uid}"
    end

    def self.refund(uid)
      DataPagos.post "/charges/#{uid}/refund"
    end
  end
end