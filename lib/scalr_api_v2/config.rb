module ScalrApiV2
  # config class
  class Config
    def initialize; end

    def mode_path(env_id)
      mode = if env_id.nil?
               'account'
             else
               Integer(env_id) >= 0 ? 'user' : 'account'
             end
      return mode == 'account' ? 'account' : "user/#{env_id}"
    end

    def config
      config = {}

      if ENV['SCALR_URL'].nil? || ENV['SCALR_KEY_ID'].nil? || ENV['SCALR_KEY_SECRET'].nil?
        config['error'] = 'Missing Environment variables, please configure SCALR_URL, SCALR_KEY_ID, SCALR_KEY_SECRET'
        raise 'Missing Environment variables, please configure SCALR_URL, SCALR_KEY_ID, SCALR_KEY_SECRET'
      else
        config['url'] = ENV['SCALR_URL']
        config['key_id'] = ENV['SCALR_KEY_ID']
        config['key_secret'] = ENV['SCALR_KEY_SECRET']
        config['env_id'] = ENV['SCALR_ENV_ID'].nil? ? nil : ENV['SCALR_ENV_ID']
        config['mode_path'] = mode_path(config['env_id'])
      end
      return config
    end
  end
end
