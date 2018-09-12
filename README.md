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
  uid: '12345678',
  info: {
    name: 'JohnDoe',
    email: 'johndoe@gmail.com',
    nickname: 'johndoe',
    description: 'My channel.',
    image: 'http://static-cdn.jtvnw.net/jtv-static/404_preview-300x300.png',
    urls: {
      Twitch: 'http://www.twitch.tv/johndoe'
    }
  },
  credentials: {
    token: 'asdfghjklasdfghjklasdfghjkl', # OAuth 2.0 access_token, which you may wish to store
    expires: false # this will always be false,
    refresh_token: 'asdschbjh24h23yfsjfhbsjdc3a' # OAuth 2.0 refresh token, to renew the access token when it expires
  },
  extra: {
    raw_info: {
      display_name: 'JohnDoe',
      id: '12345678',
      login: 'johndoe',
      type: '',
      broadcaster_type: '',
      description: 'My channel.',
      profile_image_url: 'https://static-cdn.jtvnw.net/user-default-pictures/0ecbb6c3-fecb-4016-8115-aa467b7c36ed-profile_image-300x300.jpg',
      offline_image_url: '',
      view_count: 100500,
      email: 'johdoe@gmail.com'
    }
  }
}
```
