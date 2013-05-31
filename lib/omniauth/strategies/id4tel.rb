require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Id4tel < OmniAuth::Strategies::OAuth2
      option :name, :id4tel

      option :client_options, {
        site: "http://id4tel.com",
        authorize_url: "http://id4tel.com/oauth/authorize",
        token_url: 'http://id4tel.com/oauth/token',
      }
      option :provider_ignores_state, true

      def request_phase
        super
      end

      def authorize_params
        super.tap do |params|
          %w[scope client_options].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]
            end
          end
        end
      end

      def new_login
        'login'
      end

      def request_phase
        #redirect client.auth_code.authorize_url({:redirect_uri => callback_url, :new_login => new_login}.merge(authorize_params))
        redirect client.auth_code.authorize_url({:redirect_uri => callback_url}.merge(authorize_params))
      end

      uid do
        raw_info["id"]
      end

      info do
        { email: raw_info["email"], code: raw_info['info']  }
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info = access_token.get('/api/v1/userinfo/get').parsed
      end
    end
  end
end
