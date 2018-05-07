require 'sinatra/activerecord'
require '../models/issue.rb'
require '../models/user.rb'

User.create!(telegram_username: '@bukanjohn', telegram_user_id: 218550401, jira_user_key: 'johnstephanus', jira_user_email: 'johnstephanus@ymail.com')
