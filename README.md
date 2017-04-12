[![Build Status](https://travis-ci.org/sayhiben/rails-saas-boilerplate.svg?branch=master)](https://travis-ci.org/sayhiben/rails-saas-boilerplate)

# Rails SaaS Boilerplate

This project provides a starting place for building software as a service applications in Ruby on Rails. To use, clone this repository and start working. 

## Status

Doubt everything in this readme. You're lucky if the server starts. See the [**Version 0** Project](https://github.com/sayhiben/rails-saas-boilerplate/projects/1) here on Github to see what's in development.

### Scope:
_These are not yet fully implemented_

- ✅ Rails 5
- ✅ Authentication using Devise
- ⚠ Admin interface using ActiveAdmin
- ⚠ Subscription management using Stripe via Payola Payments
- ⛔ Feature Flipping/Flagging using Flipper
- ⚠ Authorization via Pundit & Rolify
- ✅ Bootstrap 4 & Font Awesome
- ⚠ Background jobs with Sidekiq
- ✅ Postgres
- ✅ rvm
- ✅ Code quality checks with Brakeman, Rubocop, and Rails Best Practices
- ⛔ Tests of dubious quality

## Getting started
First, get Postgres installed and running. Then, run this:
```
git clone https://github.com/sayhiben/rails-saas-boilerplate
cd rails-saas-boilerplate
gem install bundler
bundle install
cp .env_sample .env
```

Next, edit `.env` and insert your own secrets.

Finally, this:
```
rake db:create && rake db:migrate && rake db:seed
```

Now, you _might_ be able to run the server: 
```
rails s
```

See `db/seeds.rb` for default user info.
