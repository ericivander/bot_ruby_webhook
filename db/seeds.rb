require 'sinatra/activerecord'
require_relative '../models/issue.rb'
require_relative '../models/user.rb'

User.create!(telegram_username: '@bukanjohn', telegram_user_id: 218550401, jira_user_key: 'johnstephanus', jira_user_email: 'johnstephanus@ymail.com')
User.create!(telegram_username: '@putramuttaqin', telegram_user_id: 267031124, jira_user_key: 'putra.muttaqin', jira_user_email: 'putra.muttaqin@bukalapak.com')
User.create!(telegram_username: '@adifaisalr', telegram_user_id: 463863778, jira_user_key: 'adi.faisal', jira_user_email: 'adi.faisal@bukalapak.com')
User.create!(telegram_username: '@maulburz', telegram_user_id: 189841678, jira_user_key: 'maulana.muzakki', jira_user_email: 'maulana.muzakki@outlook.com')
User.create!(telegram_username: '@windurisky', telegram_user_id: 376651180, jira_user_key: 'windu.risky', jira_user_email: 'windu.risky@bukalapak.com')
User.create!(telegram_username: '@ericivander', telegram_user_id: 202215133, jira_user_key: 'eric.ivander', jira_user_email: 'eric.ivander@bukalapak.com')
User.create!(telegram_username: '@arsoedjono', telegram_user_id: 290304974, jira_user_key: 'aranda.rizki', jira_user_email: 'aranda.rizki@bukalapak.com')
