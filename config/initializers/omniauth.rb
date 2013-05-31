require File.expand_path('lib/omniauth/strategies/id4tel', Rails.root)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :id4tel, 'c7d102b8c1d1ccec91132c37c25d748357ab6c52068b274d9f4835c363cfd626' , 'c9b88426ca08b032205fe5bfcbfbb42a153911290f2399d9b9fd55550d494413' 
end