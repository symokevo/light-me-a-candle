Rails.application.routes.draw do
  devise_for :users

  resources :heroes do
    resources :candles, only: [:create]
    resources :notes, only: [:create]
  end

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }


  root 'heroes#index'
end
