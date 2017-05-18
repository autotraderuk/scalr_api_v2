# ScalrApiV2::Servers
module ScalrApiV2
  require 'json'

  # connection and request methods for interacting with the Scalr API
  class Servers
    def initialize
      @config = ScalrApiV2::Config.new.config
      @scalr = ScalrApiV2::Request.new
    end

    # List all scripts
    def list
      list = @scalr.list(format('/api/v1beta0/%s/servers/', @config['mode_path']))
      return list
    end

    # TODO: add remaining api calls
  end
end
