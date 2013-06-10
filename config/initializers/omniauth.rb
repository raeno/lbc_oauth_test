require File.expand_path('lib/omniauth/strategies/id4tel', Rails.root)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :id4tel, 'eb79d0ed86fca39c3ab45f46178a4f0a39506187c525ea65522f845521a6cfea' , 'cef6c392449cea76fd40c8c9432c651de91e23701ea0a8aafb7e1aff5d760898' 
  #provider :id4tel, '6c6f91d4dc6f467dd090f8e8b25c38049ae455cdba75a391bf322055135af1d3' , '3e3a90b32147881d2526374f44aa2ce0c165f051b13d15b250a49616209cd306' 
  
end