Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'games#new'

  resource :game, controller: 'games', only: [:new, :create, :update]
  resource :player, controller: 'players', only: [:show, :create, :destroy]
  resources :invitation, param: :uuid, controller: 'invitations', path: 'join', only: [:show, :update]
end
