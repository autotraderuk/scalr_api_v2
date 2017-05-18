# ScalrApiV2::Farms
module ScalrApiV2
  require 'json'

  # connection and request methods for interacting with the Scalr API
  class Farms
    def initialize
      @config = ScalrApiV2::Config.new.config
      @scalr = ScalrApiV2::Request.new
    end

    # List all scripts
    def list
      list = @scalr.list(format('/api/v1beta0/%s/farms/', @config['mode_path']))
      return list
    end

    # TODO: add remainig api calls
  end
end
