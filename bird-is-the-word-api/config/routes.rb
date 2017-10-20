Rails.application.routes.draw do
  namespace :api do
    resources :users, except: [:new, :edit] do
      get '/games', to: "users#games"
    end
    post '/auth', to: "auth#login"
    post 'auth/refresh', to: "auth#refresh"
    resources :games, except: [:new, :edit] 
    get '/available_games', to: "games#available_games"
    post '/skip_turn', to: "games#skip_turn"
  end
end
 