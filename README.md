[![Gem Version](https://badge.fury.io/rb/omniauth-twitch.svg)](http://badge.fury.io/rb/omniauth-twitch)

# OmniAuth::Twitch

A OmniAuth strategy for Twitch recently updated to helix api

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

## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  provider: 'twitch',
  uid: 12345678,
  info: {
    name: 'JohnDoe',
    email: 'johndoe@gmail.com',
    nickname: 'johndoe',
    description: 'My channel.',
    image: 'http://static-cdn.jtvnw.net/jtv-static/404_preview-300x300.png',
  },
  credentials: {
    token: 'asdfghjklasdfghjklasdfghjkl', # OAuth 2.0 access_token, which you may wish to store
    expires: false # this will always be false
  },
  extra: {
    raw_info: {
      display_name: 'JohnDoe',
      _id: 12345678,
      name: 'johndoe',
      type: 'user',
      bio:"My channel.",
      created_at:"2011-07-01T19:46:21Z",
      updated_at:"2014-05-06T05:59:37Z",
      logo:nil,
      _links: { self: 'https://api.twitch.tv/kraken/users/johndoe'},
      email:'johdoe@gmail.com',
      partnered:false
    }
  }
}
```
