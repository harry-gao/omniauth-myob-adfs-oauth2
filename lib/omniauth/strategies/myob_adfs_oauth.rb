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
        :token_url => '/adfs/oauth2/token',
      }

      option :authorize_options, [:resource]

      uid { raw_info['email'] }

      info do
        {
          :email => raw_info['email']
        }
      end

      def raw_info
        return @raw_info if @raw_info
        token = Base64.decode64(access_token.token)
        @raw_info = JSON.parse(token.scan(/({[^}]*})/).second.first)
      end

    end
  end
end