require "base64"

module Channel
  module Jira
    class Base

      def auth
        encoded_auth = Base64.encode64("#{ENV['JIRA_AUTH_USERNAME']}:#{ENV['JIRA_AUTH_PASSWORD']}")
        "Basic #{encoded_auth}"
      end

      def run!
        raise NotImplementedError
      end
      
    end
  end
end
