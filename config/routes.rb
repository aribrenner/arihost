Rails.application.routes.draw do
  get ':short_url', to: 'redirects#get_node'
  get 'images/:short_url', to: 'redirects#get_pixel'

  root 'users#new'

  resource :session

  scope :app do

    resources :nodes, param: :short_url do
      get 'hits', to: 'hits#node_index'
    end

    resources :pixels, param: :short_url do
      get 'hits', to: 'hits#pixel_index'
    end

    resources :users, param: :username
  end

end
