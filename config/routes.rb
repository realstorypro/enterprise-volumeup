Rails.application.routes.draw do
  devise_for :users
  apipie

  root "page#index"

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resource :test, only: %i[index]
    end
  end
end