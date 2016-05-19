Rails.application.routes.draw do

  root 'users#new'

  resources :nodes, param: :short_url
  get ':short_url', to: 'nodes#find_redirect'

  resources :users, param: :username

end
