require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Twitch < OmniAuth::Strategies::OAuth2

      option :name, "twitch"

      option :client_options, {
        site: 'https://api.twitch.tv',
        authorize_url: "/kraken/oauth2/authorize",
        token_url: '/kraken/oauth2/token'
      }

      uid{ raw_info['_id'] }

      info do
        {
          display_name: raw_info['display_name'],
          name: raw_info['name'],
          email: raw_info['email'],
          bio: raw_info['bio'],
          logo: raw_info['logo'],
          type: raw_info['type']
        }
      end
    end
  end
end
