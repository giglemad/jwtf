require 'jwt'

module JWTF
  class Encode
    attr_reader :config

    def initialize(config)
      @config = config
    end

    def call(params = {})
      ::JWT.encode(payload.call(params), secret, algorithm)
    end

    private
    extend Forwardable
    def_delegators :@config, :payload, :algorithm, :secret
  end
end
