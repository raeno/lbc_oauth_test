PartnerSiteId4tel::Application.routes.draw do
  devise_for :users

  resources :tasks

  match '/auth/:provider/callback', to: 'sessions#create'
  match '/signout', to: 'sessions#destroy', as: 'signout'


  root :to => 'tasks#index'
end
