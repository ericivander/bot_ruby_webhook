require 'sinatra/activerecord'
require_relative '../models/issue.rb'
require_relative '../models/user.rb'

User.create!(telegram_username: '@bukanjohn', telegram_user_id: 218550401, jira_user_key: 'johnstephanus', jira_user_email: 'johnstephanus@ymail.com')
User.create!(telegram_username: '@putramuttaqin', telegram_user_id: 267031124, jira_user_key: 'putra.muttaqin', jira_user_email: 'putra.muttaqin@bukalapak.com')