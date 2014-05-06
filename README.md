# OmniAuth::Twitch

A OmniAuth strategy for Twitch

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-twitch'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-twitch

## Usage

Here's an example for adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitch, ENV["TWITCH_CLIENT_ID"], ENV["TWITCH_CLIENT_SECRET"]
end
```
