Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    post 'authenticate', to: 'authentication#authenticate'
    get 'profile', to: 'profile#index'
    resources :movies, only: [:index, :show] do
      patch "playback", on: :member
      patch "rating", on: :member
    end

    resources :series, only: [ :index, :show ] do
      patch "rating", on: :member
    end

    resources :episodes, only: [:show] do
      patch "playback", on: :member    
    end

    resources :rentals, only: [:index] do
      post '/movies/:id' => :movies, on: :collection
      post '/series/:id' => :series, on: :collection
    end
  end
end
