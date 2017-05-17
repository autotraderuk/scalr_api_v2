# ScalrApiV2::Request
module ScalrApiV2
  require 'uri'
  require 'time'
  require 'openssl'
  require 'base64'
  require 'rest-client'
  require 'json'

  # connection and request methods for interacting with the Scalr API
  class Request
    def initialize
      @api_config = ScalrApiV2::Config.new.config
    end

    def request(method, url, body = '')
      # JSON encode body if set
      body = body.to_json if body != ''

      # Split URL into components
      parts = URI.parse(@api_config['url'] + url)

      path = parts.path
      # host = parts.host
      # port = parts.port

      query = ''
      unless parts.query.nil?
        # Convert querystring into an array
        q = parts.query.split('&')

        # Sort the querystring array
        q.sort!

        # Convert querystring array back to string
        query = q.join('&')
      end

      # Create ISO 8601 date/time string
      time = Time.now.utc.iso8601 + '+00:00'

      # Collection of request data for generating signature
      request = [
        method,
        time,
        path,
        query,
        body
      ]

      # Calculate signature based on request data
      signature = 'V1-HMAC-SHA256 ' + Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), @api_config['key_secret'], request.join("\n"))).strip

      # HTTP request headers
      headers = {
        'X-Scalr-Key-Id' => @api_config['key_id'],
        'X-Scalr-Signature' => signature,
        'X-Scalr-Date' => time,
        'X-Scalr-Debug' => '1'
      }

      headers['Content-Type'] = 'application/json' if body != ''
      begin
        response = RestClient::Request.execute(
          method: method,
          url: @api_config['url'] + url,
          headers: headers,
          payload: body
        )
      rescue => e
        raise "#{e} #{e.response}"
      end
      response = '{\n  \"Error\": \"A problem occured: Response was empty\"\n}}' if response == ''
      JSON.parse(response)
    end

    # List items from API
    def list(url)
      data = []
      until url.nil?
        response = request('GET', url)
        if response['Error'].nil?
          data.concat response['data']
          url = response['pagination']['next']
        else
          data = response['Error']
          url = nil
        end
      end
      return data
    end

    # Fetch a single item from API
    def fetch(url)
      response = request('GET', url)
      response['data'] = response['Error'] unless response['Error'].nil?
      return response['data']
    end

    # Create item in API
    def create(url, data)
      response = request('POST', url, data)
      response['data'] = response['Error'] unless response['Error'].nil?
      return response['data']
    end

    # Delete item from API
    def delete(url)
      response = request('DELETE', url)
      response['data'] = response['Error'] unless response['Error'].nil?
      return response['data']
    end

    # Edit items in API
    def post(url, data)
      response = request('POST', url, data)
      response['data'] = response['Error'] unless response['Error'].nil?
      return response['data']
    end

    # Update items in API
    def patch(url, data)
      response = request('PATCH', url, data)
      response['data'] = response['Error'] unless response['Error'].nil?
      return response['data']
    end
  end
end
