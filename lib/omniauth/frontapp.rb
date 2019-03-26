require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    # Frontapp oauth2 strategy
    class Frontapp < ::OmniAuth::Strategies::OAuth2
      option :name, 'frontapp'

      option :client_options,
             site: 'https://api2.frontapp.com',
             authorize_url: 'https://app.frontapp.com/oauth/authorize',
             token_url: 'https://app.frontapp.com/oauth/token'

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end
      
      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end

      extra do
        { 'raw_info' => raw_info }
      end
    end
  end
end
