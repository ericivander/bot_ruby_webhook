module Channel
  module Jira
    def get_issues(*args); Issue.new(*args).run!; end
  end
end
