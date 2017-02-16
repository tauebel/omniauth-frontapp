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
     
      #def authorize_params
      #  super.tap do |p|
      #      p[:redirect_uri] = 'https://local.dev/auth/frontapp/callback'
      #  end
      #end
   
      #def token_params
      #  super.tap do |p|
      #      p[:redirect_uri] = 'https://local.dev/auth/frontapp/callback'
      #  end
      #end
       
    end
  end
end
