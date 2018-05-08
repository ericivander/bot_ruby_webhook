module Channel
  module Jira
    class Issue < Base
      def initialize(jira_user)
        @jira_user = jira_user
      end

      def run!
        endpoint = ENV['JIRA_ENDPOINT'] + "/rest/agile/1.0/board/1/issue"
        response = Channel::Connection.get(endpoint, auth, query_params)
      end

      def query_params
        {
          jql: "assignee=#{@jira_user}"
        }
      end
    end
  end
end
