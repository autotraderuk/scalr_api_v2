[![Build Status](https://travis-ci.org/autotraderuk/scalr_api_v2.svg?branch=master)](https://travis-ci.org/autotraderuk/scalr_api_v2) [![Gem Version](https://badge.fury.io/rb/scalr_api_v2.svg)](https://badge.fury.io/rb/scalr_api_v2)
# ScalrApiV2

Ruby gem to allow you to develop against V2 of the [SCALR API](https://api-explorer.scalr.com)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'scalr_api_v2'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scalr_api_v2

## Usage

Set the below environment variables:

    export SCALR_API_KEY=your-api-key
    export SCALR_API_SECRET=your-api-secret
    export SCALR_URL=scalr-api-url
    export SCALR_ENV_ID=id-of-desired-environment (optional determines if request is sent as user or account i.e 'GET /api/v1beta0/account/scripts/' or 'GET /api/v1beta0/user/envId/scripts/'. defaults to account mode.)

### in your code

    require 'scalr_api_v2'
    scalr = ScalrApiV2::Farms.new
    puts scalr.list


### from your shell

    $ scalr_api_v2 farm list
    
### limitations

At present there is a limited subset of api commands avaialble via this GEM. Functionality is limited to working with scripts. As well as listing farms and servers.
Examples of the functionality provided can be found in the rspec tests.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `lib/scalr_api_v2/version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests (with tests) are welcome on GitHub at https://github.com/autotraderuk/scalr_api_v2. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

