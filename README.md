## Requirements

1. RVM `$ curl -L get.rvm.io | bash -s stable`

2. Ruby 2.4.2 (after install RVM), type `$ rvm install 2.4.2`

3. Git `$ brew install git`

4. Heroku CLI `$ brew install heroku/brew/heroku`

## How To

1. Create bot from @BotFather, get `TOKEN`

2. Fork then clone this repo to local machine, setup heroku if you wanna deploy later

3. Copy `env.sample` to `.env` with `$ cp env.sample .env`

4. Set `TELEGRAM_BOT_TOKEN` value with `TOKEN` given from BotFather to `.env`

5. Run `$ gem install bundle`

6. Run `$ bundle install`

7. Run `$ rackup`, this will start server on localhost:9292

8. To try on local, POST to `localhost:9292/message/<TOKEN>` with body
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

9. Modify function `do_something_with_text` on `main.rb`

10. Push changes to forked repo

11. Push to heroku `$ git push heroku master`

12. **(First time only)** There are 2 methods getting updates from Telegram, with webhook and long polling. We are using webhook here, set webhook url by `POST https://api.telegram.org/bot<TOKEN>/setWebhook?url=<WEBHOOK_URL>`. `WEBHOOK_URL` is `https://<YOUR_APP_NAME>.herokuapp.com:443/message/<TOKEN>`

## Setup Heroku

1. Login to Heroku `$ heroku login`

2. On your local repository do `$ heroku create <YOUR_APP_NAME>`

3. Open your Heroku apps dashboard then add new `Config Vars` with key: `TELEGRAM_BOT_TOKEN` and value: `TOKEN` under `Setting menu`
