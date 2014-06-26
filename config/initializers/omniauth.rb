require File.expand_path('lib/omniauth/strategies/id4tel', Rails.root)

OAUTH_CONFIG = YAML.load_file(Rails.root.join('config/oauth.yml'))

Rails.application.config.middleware.use OmniAuth::Builder do
  OAUTH_CONFIG['oauth_providers'].each do |provider|
    provider provider['name'].to_sym, provider['client_id'] , provider['client_secret']
  end
end
