Rails.application.routes.draw do
  resources :games, only: [:create, :show] do
    resources :moves
    member do
      post 'join'
    end
  end
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
