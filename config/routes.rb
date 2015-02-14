Rails.application.routes.draw do
  resources :tasks, only: [:create, :destroy]

  resources :passwords, only: [:create, :new]
  resource :session, controller: 'clearance/sessions', only: [:create]

  resources :users, only: [:create] do
    resource :password,
      controller: 'clearance/passwords',
      only: [:create, :edit, :update]
  end

  get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
  delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
  get '/register' => 'clearance/users#new', as: 'register'

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'users#show', as: :signed_in_root
  end
end
