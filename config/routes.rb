Rails.application.routes.draw do


  devise_for :users, :path => 'accounts'

  resources :users, shallow: true do
    resources :buckets
    resources :pins
  end

  resources :sneakers do
    resources :vendors
  end

  resources :logos, only: [:new, :create, :index]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
