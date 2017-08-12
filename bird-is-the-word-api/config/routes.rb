Rails.application.routes.draw do
  namespace :api do
    resources :users, except: [:new, :edit]
    resources :games, except: [:new, :edit]
  end
end
