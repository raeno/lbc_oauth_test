require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Id4tel < OmniAuth::Strategies::OAuth2
      option :name, :id4tel

      OAUTH_CONFIG = YAML.load_file(Rails.root.join('config/oauth.yml'))

      host = OAUTH_CONFIG['oauth_providers'].select { |p| p['name'] == 'id4tel'}.first['host']

      option :client_options, {
        site: "#{host}",
        authorize_url: "#{host}/oauth/authorize",
        token_url: "#{host}/oauth/token",
      }
      option :provider_ignores_state, true

      def authorize_params
        super.tap do |params|
          %w[scope client_options].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]
            end
          end
        end
      end

      def config
        @config ||= OAUTH_CONFIG['oauth_providers'].select { |p| p['name'] == 'id4tel'}.first
      end

      def new_login
        if config['random_login']
          "new_login_#{Random.rand(1000)}"
        else
          config['login'] || 'new_login'
        end
      end

      def request_params
        params = {:redirect_uri => callback_url,  :display => :popup }.merge(authorize_params)

        params.merge!(:login => new_login) if config['use_login']
        params.merge! :scope => config['scope'] if config['scope']
        params.merge! :optional => config['optional_fields'] if config['optional_fields']
        params
      end

      def request_phase
        uri = client.auth_code.authorize_url request_params
        redirect uri
      end

      uid do
        raw_info['id']
      end

      info do
        info_hash = { token: raw_info['target_token'], login: raw_info['login'] }
        info_hash['email'] = raw_info['email'] if raw_info.key?('email')
        puts raw_info
        info_hash
      end

      def raw_info
        access_token.options[:mode] = :query
        host = config['host']
        @raw_info = access_token.get("#{host}/api/oauth/v2/userinfo/get").parsed
      end
    end
  end
end
