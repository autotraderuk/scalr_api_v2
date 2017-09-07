# ScalrApiV2::Images
module ScalrApiV2
  require 'json'

  # connection and request methods for interacting with the Scalr API
  class Images
    def initialize
      @config = ScalrApiV2::Config.new.config
      @scalr = ScalrApiV2::Request.new
    end

    # List all scripts
    def list
      list = @scalr.list(format('/api/v1beta0/user/%s/images/', @config['env_id']))
      return list
    end

    def create(image)
      item = @scalr.create(format('/api/v1beta0/user/%s/images/', @config['env_id']), image)
      return item
    end

    def delete(image_id)
      item = @scalr.delete(format('/api/v1beta0/user/%s/images/%s', @config['env_id'], image_id))
      return item
    end

    # TODO: add remainig api calls
  end
end
