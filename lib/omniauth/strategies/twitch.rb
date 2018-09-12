require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Twitch < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = "user:read:email".freeze

      option :name, "twitch"

      option :client_options, {
        site: "https://id.twitch.tv",
        authorize_url: "/oauth2/authorize",
        token_url: "/oauth2/token"
      }

      option :access_token_options, {
        header_format: "Bearer %s",
        param_name: "access_token"
      }

      option :authorize_options, [:scope]

      credentials do
        hash = { "token" => access_token.token }
        if access_token.refresh_token
          hash["refresh_token"] = access_token.refresh_token
        end
        hash["expires_at"] = access_token.expires_at if access_token.expires?
        hash["expires"] = access_token.expires?
        hash
      end

      uid { raw_info["id"] }

      info do
        {
          name: raw_info["display_name"],
          email: raw_info["email"],
          nickname: raw_info["login"],
          description: raw_info["description"],
          image: raw_info["profile_image_url"],
          urls: { Twitch: "http://www.twitch.tv/#{raw_info['login']}" }
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
        @raw_info ||=
          access_token.get("https://api.twitch.tv/helix/users").parsed.
          fetch("data").fetch(0)
      end

      def build_access_token
        super.tap do |token|
          token.options.merge!(access_token_options)
        end
      end

      def access_token_options
        options.access_token_options.inject({}) { |h,(k,v)| h[k.to_sym] = v; h }
      end

      def callback_url
        return options[:redirect_uri] unless options[:redirect_uri].nil?
        full_host + script_name + callback_path
      end

      def authorize_params
        super.tap do |params|
          options[:authorize_options].each do |k|
            params[k] = request.params[k.to_s] unless [nil, ''].include?(request.params[k.to_s])
          end
          params[:scope] = params[:scope] || DEFAULT_SCOPE
        end
      end
    end
  end
end
