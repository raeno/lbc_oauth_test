require File.expand_path('lib/omniauth/strategies/id4tel', Rails.root)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :id4tel, '26b975865e6df5f3fb037a7d804ef0ee6bb983c852c86ce4cd24206c967bc2be' , 'ae21665ec6dd1f6c90eb6de5b706b73630bf5ecc3d2afa459db61c2a05e836ef' 
end