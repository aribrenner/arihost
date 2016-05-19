Rails.application.routes.draw do
  get ':short_url', to: 'nodes#find_redirect'

  root 'users#new'
  scope :app do

    resources :nodes, param: :short_url

    resources :users, param: :username
  end

end
