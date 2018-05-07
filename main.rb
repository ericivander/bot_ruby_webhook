require 'dotenv/load'
require 'sinatra'
require 'telegram/bot'
require 'json'
require 'active_support/core_ext/hash'
require 'sinatra/activerecord'
require './models/issue.rb'
require './models/user.rb'

class Main < Sinatra::Base
  configure do
    set :bot, Telegram::Bot::Client.new(ENV['TELEGRAM_BOT_TOKEN'])
  end

  get '/' do
    'hello world!'
  end

  post '/issues/{id}/update' do
    issue = Issue.find_by_jira_issue_id(params[:id])

    params = JSON.parse(request.body.read).with_indifferent_access
    if issue
      issue.update_attributes!(serialize_issue(params))
    else
      issue = Issue.create!(serialize_issue(params))
    end
    settings.bot.api.send_message(chat_id: 218550401, text: issue.to_s)

    200
  end

  post '/message/{token}' do
    raise 'Wrong Token' if params[:token] != ENV['TELEGRAM_BOT_TOKEN']
    update = JSON.parse(request.body.read)
    if update['message']
      message = update['message']
      puts message.to_s
      reply = do_something_with_text(message['text'], message['from']['username'])
      settings.bot.api.send_message(chat_id: message['chat']['id'], text: reply, reply_to_message_id: message['message_id'])
    end
    200
  end

  def do_something_with_text(text, username)
    reply = text
    if text == '/start'
      reply = 'Welcome to Point!'
    end
    reply# return
  end

  def serialize_issue(params)
    assignee_jira_email = params[:issue][:field][:assignee][:emailAddress]
    assigner_jira_email = params[:user][:emailAddress]
    assignee = User.find_by_jira_email(assignee_jira_email)
    assigner = User.find_by_jira_email(assigner_jira_email)

    jira_issue_id = params[:issue][:id]
    jira_issue_key = params[:issue][:key]
    jira_issue_summary = params[:issue][:fields][:summary]
    jira_issue_parent_summary = params[:issue][:fields][:parent][:summary]
    jira_issue_status = params[:issue][:fields][:status][:name]
    jira_issue_detail_status = params[:issue][:fields][:customfield_10601][:value]

    {
      asignee_id: asignee&.id,
      jira_issue_id: jira_issue_id,
      jira_issue_key: jira_issue_key,
      jira_issue_summary: jira_issue_summary,
      jira_issue_parent_summary: jira_issue_parent_summary,
      jira_issue_status: jira_issue_status,
      jira_issue_detail_status: jira_issue_detail_status,
      assigner_id: assigner.id
    }
  end
end
