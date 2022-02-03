Rails.application.routes.draw do
  resources :stores do
    resources :users
  end
end
