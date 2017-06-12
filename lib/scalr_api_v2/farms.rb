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

    # List farm details
    def get_farm(farm_id)
      list = @scalr.list(format('/api/v1beta0/%s/farms/%s', @config['mode_path'], farm_id))
      return list
    end

    # List farm details
    def list_farm_servers(farm_id)
      list = @scalr.list(format('/api/v1beta0/%s/farms/%s/servers/', @config['mode_path'], farm_id))
      return list
    end

    # TODO: add remainig api calls
  end
end
