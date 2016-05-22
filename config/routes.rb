Rails.application.routes.draw do
  get ':short_url', to: 'redirects#get_node'
  get 'images/:short_url', to: 'redirects#get_pixel'

  root 'users#new'

  resource :session

  scope :app do

    resources :nodes, param: :short_url do
      resources :hits, only: :index
    end

    resources :hits, only: :index

    resources :users, param: :username
  end

end
