require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    # Frontapp oauth2 strategy
    class Frontapp < ::OmniAuth::Strategies::OAuth2
      option :name, 'frontapp'

      option :client_options,
             site: 'https://app.frontapp.com',
             authorize_url: 'https://app.frontapp.com/oauth/authorize',
             token_url: 'https://app.frontapp.com/oauth/token'

      uid { raw_info['id'] }

      info do
        {
          email: raw_info['email'],
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def authorize_params
        # for now override the scope here so that we can
        # call /v1/me and get current users information
        super.tap { |p| p[:response_type] = 'code' }
      end

      #idef callback_url
        # Fixes regression in omniauth-oauth2 v1.4.0 by https://github.com/intridea/omniauth-oauth2/commit/85fdbe117c2a4400d001a6368cc359d88f40abc7
      #  options[:callback_url] || (full_host + script_name + callback_path)
      #end

      def raw_info
        @raw_info ||= access_token.get('me').parsed
      end
    end
  end
end
