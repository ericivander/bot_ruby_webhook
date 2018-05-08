class TelegramJiraMapper
  def self.mapping
    file = File.read('telegram_jira_mapping.json')
    JSON.parse(file)
  end

  def self.get_jira_user(telegram_user)
    user = mapping.detect { |user| user["telegram"] == telegram_user }
    user["jira"]
  end
end
