require 'net/http'
require 'net/https'
require 'json'

module DataPagos
  class Token
    def self.show(uid)
      DataPagos.get "/tokens/#{uid}"
    end
  end
end