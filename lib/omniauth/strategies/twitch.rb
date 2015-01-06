require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Twitch < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = 'user_read'

      option :name, "twitch"

      option :client_options, {
        site: 'https://api.twitch.tv',
        authorize_url: "/kraken/oauth2/authorize",
        token_url: '/kraken/oauth2/token'
      }

      option :access_token_options, {
        header_format: 'OAuth %s',
        param_name: 'access_token'
      }

      option :authorize_options, [:scope]

      uid{ raw_info['_id'] }

      info do
        {
          name: raw_info['display_name'],
          email: raw_info['email'],
          nickname: raw_info['name'],
          description: raw_info['bio'],
          image: raw_info['logo'],
          urls: { Twitch: "http://www.twitch.tv/#{raw_info['name']}" }
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/kraken/user.json').parsed
      end

      def build_access_token
        super.tap do |token|
          token.options.merge!(access_token_options)
        end
      end

      def access_token_options
        options.access_token_options.inject({}) { |h,(k,v)| h[k.to_sym] = v; h }
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
