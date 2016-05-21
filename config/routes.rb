Rails.application.routes.draw do
  get ':short_url', to: 'redirects#find_redirect', param: :short_url

  root 'users#new'
  scope :app do

    resources :nodes, param: :short_url

    resources :users, param: :username
  end

end
