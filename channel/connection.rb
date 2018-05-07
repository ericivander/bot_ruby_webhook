module Channel
  module Connection
    RestDefault = { open_timeout: 5, timeout: 5 }

    def self.restclient(opts, &block)
      payload = opts.except(:headers)

      response = RestClient::Request.execute(RestDefault.merge(opts), &block)
      response = JSON.parse response.body

      response
    rescue => e
      raise e
    end

    def self.get(url, auth, query={})
      restclient_connection('get', url, auth, {}, query)
    end

    def self.post(url, auth, payload)
      restclient_connection('post', url, auth, payload)
    end

    def self.patch(url, auth, payload)
      restclient_connection('patch', url, auth, payload)
    end

    def self.restclient_connection(http_method, url, auth, payload={}, query={})
      headers = {
        host: "api.bukalapak.com",
        authorization: auth,
        content_type: :json,
        accept: :json,
        user_agent: "Bukalapak"
      }

      case http_method.to_sym
      when :get
        headers[:params] = query
        restclient(
          context,
          {
            method: http_method.to_sym,
            url: url,
            headers: headers
          }
        )
      when :post, :patch
        restclient(
          context,
          {
            method: http_method.to_sym,
            url: url,
            payload: payload.to_json,
            headers: headers,
            timeout: 60
          }
        )
      else
        raise 'unsupported method'
      end
    end

  end
end
