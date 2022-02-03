Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :stores

      end
    end
  end
end
