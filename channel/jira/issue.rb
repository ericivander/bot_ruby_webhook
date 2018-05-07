module Channel
  module Jira
    class Issue < Base
      def initialize(jira_user)
        @jira_user = jira_user
      end

      def run!
        endpoint = ENV['JIRA_ENDPOINT']
        response = Channel::Connection.get(endpoint, auth, query_params)
      end

      def query_params
        
      end
    end
  end
end
