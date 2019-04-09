Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do

    resources :movies, only: [:index, :show]
    resources :series, only: [:index, :show]
    resources :episodes, only: [:show]

    resources :rentals, only: [:index, :show] do
      post '/movies/:id' => :movies, on: :collection
      post '/series/:id' => :series, on: :collection
    end
  end
end
