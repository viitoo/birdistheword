Rails.application.routes.draw do
  namespace :api do
    resources :users, except: [:new, :edit]
    post '/auth', to: "auth#login"
    post 'auth/refresh', to: "auth#refresh"
    resources :games, except: [:new, :edit]
  end
end
 