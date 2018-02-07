require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Twitch < OmniAuth::Strategies::OAuth2

      option :name, "twitch"

      option :client_options, {
        site: "https://api.twitch.tv",
        authorize_url: "/kraken/oauth2/authorize",
        token_url: "/kraken/oauth2/token"
      }

      option :authorize_params, {}
      option :authorize_options, [:scope, :response_type]

      option :response_type, "code"

      option :access_token_options, {
        header_format: 'OAuth %s',
        param_name: "code"
      }

      uid { raw_info["data"].first["id"] }

      info do
        {
          name: raw_info["data"].first["display_name"],
          email: raw_info["data"].first["email"],
          nickname: raw_info["data"].first["login"],
          description: raw_info["data"].first["description"],
          image_url: raw_info["data"].first["profile_image_url"],
          urls: { twitch: "http://www.twitch.tv/#{raw_info['name']}" }
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
        @_raw_info ||= access_token.get("/helix/users.json").parsed
      end

      def callback_url
        full_host + callback_path
      end
    end
  end
end
