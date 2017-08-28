Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    resources :tours do
      resources :bookings
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
