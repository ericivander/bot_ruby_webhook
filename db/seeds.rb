require 'sinatra/activerecord'
require_relative '../models/issue.rb'
require_relative '../models/user.rb'

User.create!(telegram_username: '@bukanjohn', telegram_user_id: 218550401, jira_user_key: 'johnstephanus', jira_user_email: 'johnstephanus@ymail.com')
User.create!(telegram_username: '@maulburz', telegram_user_id: 189841678, jira_user_key: 'maulana.muzakki', jira_user_email: 'maulana.muzakki@outlook.com')
