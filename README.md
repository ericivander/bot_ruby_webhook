## Requirements

1. RVM `$ curl -L get.rvm.io | bash -s stable`

2. Ruby 2.4.2 (after install RVM), type `$ rvm install 2.4.2`

3. Git `$ brew install git`

4. Heroku CLI `$ brew install heroku/brew/heroku`

## How To

1. Create bot from @BotFather, get `TOKEN`

2. Fork then clone this repo to local machine, setup heroku if you wanna deploy later

3. Copy `env.sample` to `.env`, set `TELEGRAM_BOT_TOKEN` to `TOKEN` given from BotFather

4. Run `$ gem install bundle`

5. Run `$ bundle install`

6. Run `$ rackup`, this will start server on localhost:9292

7. To try on local, POST to `localhost:9292/message/<TOKEN>` with body
```
{
  "message": {
    "from": {
      "username": "<YOUR_USERNAME>"
    },
  	"chat": {
  		"id": <YOUR_TELEGRAM_ID>
  	},
  	"text": "hi"
  }
}
```

8. Modify function `do_something_with_text` on `main.rb`

9. Push changes to forked repo

10. Push to heroku `$ git push heroku master`

11. **(First time only)** There are 2 methods getting updates from Telegram, with webhook and long polling. We are using webhook here, set webhook url by `POST https://api.telegram.org/bot<TOKEN>/setWebhook?url=<WEBHOOK_URL>`. `WEBHOOK_URL` is `https://<YOUR_APP_NAME>.herokuapp.com:443/message/<TOKEN>`

## Setup Heroku

1. Login to Heroku `$ heroku login`

2. On your local repository do `$ heroku create <YOUR_APP_NAME>`
