Rails.application.routes.draw do

  resources :nodes, param: :short_url


  get ':short_url', to: 'nodes#find_redirect'

end
