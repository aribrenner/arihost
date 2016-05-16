Rails.application.routes.draw do

  get ':short_url', to: 'nodes#find_redirect'

end
