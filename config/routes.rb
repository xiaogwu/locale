Locale::Application.routes.draw do
  get "sessions/create"
  #Root
  root 'home#index'

  #Home Controller
  get '/map', to: 'home#map'
  get '/twitter', to: 'home#twitter'
  get '/instagram', to: 'home#instagram'
  get '/foursquare', to: 'home#foursquare'

  #Posts Controller
  resources :posts do 
    resources :comments
  end 

  #Omniauth callback
  get 'auth/:provider/callback', to: 'sessions#create'

  #Omniauth signout
  get 'signout', to: 'sessions#destroy', as: 'signout'

  #Omniauth failure
  get 'auth/failure', to: redirect('/')
end
