module ScalrApiV2
  # config class
  class Config
    def initialize; end

    def config
      config = {}

      if ENV['SCALR_URL'].nil? || ENV['SCALR_KEY_ID'].nil? || ENV['SCALR_KEY_SECRET'].nil? || ENV['SCALR_ENV_ID'].nil?
        config['error'] = 'Missing Environment variables, please configure SCALR_URL, SCALR_KEY_ID, SCALR_KEY_SECRET, SCALR_ENV_ID'
        raise 'Missing Environment variables, please configure SCALR_URL, SCALR_KEY_ID, SCALR_KEY_SECRET, SCALR_ENV_ID'
      else
        config['url'] = ENV['SCALR_URL']
        config['key_id'] = ENV['SCALR_KEY_ID']
        config['key_secret'] = ENV['SCALR_KEY_SECRET']
        config['env_id'] = ENV['SCALR_ENV_ID']
      end
      return config
    end
  end
end
