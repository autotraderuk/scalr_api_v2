# ScalrApiV2::CLI
module ScalrApiV2
  require 'thor'
  require 'scalr_api_v2'

  # define CLI class that extends Thor
  class Script < Thor
    desc 'list', 'lists scripts avaialble in scalr'
    def list
      puts JSON.generate(ScalrApiV2::Scripts.new.list)
    end

    desc 'versions', 'lists script versions avaialble in scalr'
    option :script_id, required: true
    def versions
      puts JSON.generate(ScalrApiV2::Scripts.new.versions(options[:script_id]))
    end

    desc 'create', 'creates script and makes it available in scalr'
    option :script_object, required: true
    def create
      puts JSON.generate(ScalrApiV2::Scripts.new.create(options[:script_object]))
    end

    desc 'create_version', 'creates script version and makes it available in scalr'
    option :script_id, required: true
    option :script_object, required: true
    def create_version
      puts JSON.generate(ScalrApiV2::Scripts.new.create_version(options[:script_id], options[:script_object]))
    end

    desc 'update', 'updates script version and makes it available in scalr'
    option :script_id, required: true
    option :script_version, required: true
    option :script_object, required: true
    def update
      puts JSON.generate(ScalrApiV2::Scripts.new.update_version(options[:script_id], options[:script_version], options[:script_object]))
    end

    desc 'execute', 'executes script on server specified'
    option :script_id, required: true
    option :script_version, required: false
    option :script_execution_object, required: true
    def execute
      if options[script_version].nil?
        puts JSON.generate(ScalrApiV2::Scripts.new.execute(options[:script_id], options[:script_execution_object]))
      else
        puts JSON.generate(ScalrApiV2::Scripts.new.execute_version(options[:script_id], options[:script_version], ooptions[:script_execution_object]))
      end
    end
  end

  # define CLI class that extends Thor
  class Farm < Thor
    desc 'list', 'lists farms avaialble in scalr'
    def list
      puts JSON.generate(ScalrApiV2::Farms.new.list)
    end
  end

  # define CLI class that extends Thor
  class Server < Thor
    desc 'list', 'lists servers avaialble in scalr'
    def list
      puts JSON.generate(ScalrApiV2::Servers.new.list)
    end
  end

  # define CLI class that extends Thor
  class CLI < Thor
    desc 'version', 'prints version number'
    def version
      puts ScalrApiV2::VERSION
    end

    desc 'scripts', 'provides access to manage scalr scripts'
    subcommand 'script', Script

    desc 'farm', 'provides access to manage scalr farms'
    subcommand 'farm', Farm

    desc 'server', 'provides access to manage scalr servers'
    subcommand 'server', Server
  end
end
