require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class MyobAdfsOauth < OmniAuth::Strategies::OAuth2
      
      option :name, 'myob_adfs_oauth'

      option :scope, 'email'
      option :token_method, :post
      option :resource, 'http://localhost:3000/support'

      option :client_options, {
        :site          => 'https://adfs.myob.com.au',
        :authorize_url => '/adfs/oauth2/authorize',
        :token_url => 'adfs/oauth2/token',
      }

      option :authorize_options, [:resource]

      uid { raw_info['uid'] }

      info do
        {
          :email => raw_info['username']
        }
      end

       extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token['user']
      end

    end
  end
end