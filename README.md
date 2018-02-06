# OmniAuth::Twitch

A OmniAuth strategy for Twitch

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-twitch', github: 'paladinsoftware/omniauth-twitch-helix'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-twitch

## Usage

Here's an example for adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitch, ENV["TWITCH_CLIENT_ID"], ENV["TWITCH_CLIENT_SECRET"], scope: 'user:read:email'
end
```

## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  "provider" => "twitch",
  "uid" => "123456",
  "info" => {
    "name" => "piotrjaworskipaladin",
    "email" => "piotr.jaworski@paladinsoftware.com",
    "nickname" => "piotrjaworskipaladin",
    "description" => "test desc",
    "image" => "https://static-cdn.jtvnw.net/jtv_user_pictures/822e54cf-6bf2-4818-b36a-cbe787c3aa1e-profile_image-300x300.jpg",
    "urls" => {
      "twitch" => "http://www.twitch.tv/piotrjaworskipaladin"
    }
  },
  "credentials" => {
    "token" => "4eqw0ifdsif0iwef0isd",
    "refresh_token" => "40ewfds09fds90fsd90f",
    "expires_at" => 1517943718,
    "expires" => true
  },
  "extra" =>  {
    "raw_info" =>  {
      "data" =>  [
        {
          "id" => "123456",
          "login" => "piotrjaworskipaladin",
          "display_name" => "piotrjaworskipaladin",
          "type" => "",
          "broadcaster_type" => "",
          "description" => "test desc",
          "profile_image_url" => "https://static-cdn.jtvnw.net/jtv_user_pictures/822e54cf-6bf2-4818-b36a-cbe787c3aa1e-profile_image-300x300.jpg",
          "offline_image_url" => "",
          "view_count" => 3,
          "email" => "piotr.jaworski@paladinsoftware.com"
        }
      ]
    }
  }
}
```
