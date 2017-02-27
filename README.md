# Demo

Run separately
```
$ rails s
$ guard
```

# Implementation log

* Default rails app
* Create a `home` page with `index`, setup `root` in `routes.rb`
* Add custom developer log formatter: `./config/initializers/log_formatter.rb`

### Livereload and guard 

* Add gems: `guard`, `guard-livereload`, `rack-livereload`, `rb-fsevent`
* Add javascript inject call to `./config/environments`.
* Add livereload to `Guardfile` with `$ guard init livereload`.

### Add Devise

* Add gem: 'devise'
* `$ rails g devise:install`
* Setup `action_mailer` configuration in `./config/environments/development.rb`
* `$ rails g devise User`
* `$ rails db:migrate`

### Using MailCatcher for email testing

```
$ gem install mailcatcher
$ mailcatcher
$ open http://localhost:1080
```

`environments/development.rb`
```ruby
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = { :address => '127.0.0.1', :port => 1025 }
config.action_mailer.raise_delivery_errors = false
```

### Semantic UI

```ruby
gem 'semantic-ui-sass', git: 'https://github.com/doabit/semantic-ui-sass.git'
```
* Add import and require to `application.scss` and `application.js`.

### ENVs

```
FACEBOOK_APP_ID
FACEBOOK_APP_SECRET
TWITCH_CLIENT_ID
TWITCH_CLIENT_SECRET
TWITCH_REDIRECT_URL
```

```
TWITCH_REDIRECT_URL=http://localhost:3000/users/auth/twitch/callback TWITCH_CLIENT_ID=1234 TWITCH_CLIENT_SECRET=1234 FACEBOOK_APP_ID=1234 FACEBOOK_APP_SECRET=1234 rails s -b 0.0.0.0
```