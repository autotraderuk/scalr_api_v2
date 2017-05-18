# ScalrApiV2::Scripts
module ScalrApiV2
  # Class with the name of the GEM
  # require 'uri'
  # require 'time'
  # require 'openssl'
  # require 'base64'
  # require 'rest_client'
  # require 'json'
  require 'json'

  # connection and request methods for interacting with the Scalr API
  class Scripts
    def initialize
      @config = ScalrApiV2::Config.new.config
      @scalr = ScalrApiV2::Request.new
    end

    # List all scripts
    def list
      list = @scalr.list(format('/api/v1beta0/%s/scripts/', @config['mode_path']))
      return list
    end

    # List all script versions
    def versions(script_id = 1)
      list = @scalr.list(format('/api/v1beta0/%s/scripts/%s/script-versions/', @config['mode_path'], script_id))
      return list
    end

    # Create script accepts script_object as hash and generates JSON before making SCALR api call
    def create(script_object)
      item = @scalr.create(format('/api/v1beta0/%s/scripts/', @config['mode_path']), JSON.generate(script_object))
      return item
    end

    # Create script version
    def create_version(script_id, script_object)
      item = @scalr.create(format('/api/v1beta0/%s/scripts/%s/script-versions/', @config['mode_path'], script_id), JSON.generate(script_object))
      return item
    end

    # Update script version
    def update_version(script_id, script_version, script_object)
      item = @scalr.patch(format('/api/v1beta0/%s/scripts/%s/script-versions/%s/', @config['mode_path'], script_id, script_version), JSON.generate(script_object))
      return item
    end

    # execute version
    def execute(script_id, script_execution_object)
      item = @scalr.post(format('/api/v1beta0/%s/scripts/%s/actions/execute', @config['mode_path'], script_id), JSON.generate(script_execution_object))
      return item
    end

    # execute script version
    def execute_version(script_id, script_version, script_execution_object)
      item = @scalr.post(format('/api/v1beta0/%s/scripts/%s/script-versions/%s/actions/execute', @config['mode_path'], script_id, script_version), JSON.generate(script_execution_object))
      return item
    end
  end
end
