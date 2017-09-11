Rails.application.routes.draw do
  namespace :api do
    resources :users, except: [:new, :edit]
    post '/auth', to: "auth#login"
    resources :games, except: [:new, :edit]
  end
end
 