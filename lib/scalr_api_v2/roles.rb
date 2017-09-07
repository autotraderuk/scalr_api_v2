# ScalrApiV2::Roles
module ScalrApiV2
  require 'json'

  # connection and request methods for interacting with the Scalr API
  class Roles
    def initialize
      @config = ScalrApiV2::Config.new.config
      @scalr = ScalrApiV2::Request.new
    end

    # List all scripts
    def list
      list = @scalr.list(format('/api/v1beta0/user/%s/roles/', @config['env_id']))
      return list
    end

    def create(role)
      item = @scalr.create(format('/api/v1beta0/user/%s/roles/', @config['env_id']), role)
      return item
    end

    def delete(role_id)
      item = @scalr.delete(format('/api/v1beta0/user/%s/images/%s', @config['env_id'], role_id))
      return item
    end

    def list_images(role_id)
      list = @scalr.list(format('/api/v1beta0/user/%s/roles/%s/images', @config['env_id'], role_id))
      return list
    end

    def associate_image(role_id, payload)
      item = @scalr.create(format('/api/v1beta0/user/%s/roles/%s/images', @config['env_id'], role_id), payload)
      return item
    end

    # TODO: add remainig api calls
  end
end
