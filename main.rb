require 'dotenv/load'
require 'sinatra'
require 'telegram/bot'
require 'net/http'
require 'uri'
require 'json'

class Main < Sinatra::Base
  configure do
    set :bot, Telegram::Bot::Client.new(ENV['TELEGRAM_BOT_TOKEN'])
  end

  get '/' do
    'hello world!'
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
    reply = "You just typed #{text}"
    if text == '/start'
      reply = 'Welcome to Point!'
    elsif text == '/get'
      reply = retrieve_assigned_issue('maulana.muzakki')
    end
    reply# return
  end

  def retrieve_assigned_issue(username)
    uri = URI.parse("https://welcometopoint.atlassian.net/rest/agile/1.0/board/1/issue?jql=assignee=" + username)

    header = {'Content-Type': 'text/json', 'Authorization': 'Basic YWRpZmFpc2FsLnJAZ21haWwuY29tOlF3blNoQlFia0lkM1N4Z2FoY3lqNkNFNw=='}

    # Create the HTTP objects
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri, header)

    # Send the request
    response = http.request(request)

    response# return
  end
end
