class ShortUrlMatcher
  def matches?(request)
    request.path.exclude?('.')
  end
end

Rails.application.routes.draw do
  get ':short_url', to: 'redirects#get_node', constraints: ShortUrlMatcher.new
  get 'images/:short_url', to: 'redirects#get_pixel'

  root 'sessions#new'


  scope :app do

    resource :session

    resources :nodes, param: :short_url do
      get 'hits', to: 'hits#node_index'
    end

    resources :pixels, param: :short_url do
      get 'hits', to: 'hits#pixel_index'
    end

    resources :hits, only: :destroy
    resources :users, param: :username

  end

  namespace :api, defaults: { format: :json } do
    resources :nodes, param: :short_url do
      resources :hits, only: :index
    end

    resources :pixels, param: :short_url do
      resources :hits, only: :index
    end
  end

  get '*node_redirect_url', to: 'nodes#new', format: false

end
