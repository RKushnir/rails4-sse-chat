Chat::Application.routes.draw do
  resources :channels, only: [:index, :show, :new, :create] do
    resources :messages, only: [:index, :create]
  end

  devise_for :users

  devise_scope :user do
    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  root to: 'channels#index'
end
