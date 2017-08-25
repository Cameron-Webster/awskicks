require 'sidekiq/web'

Rails.application.routes.draw do


  devise_for :users, :path => 'accounts'

  get 'accounts/sign_out', to: 'devise/sessions#destroy'

  authenticate :user, lambda { |u| u.admin? } do

   mount Sidekiq::Web => '/sidekiq'

  end

  resources :users, only: [:show]
  #    resources :buckets, except: [:show]
  #   resources :buckets, path: "", as: "bucket_show", only: [:show]
  # end

  resources :blogs
  resources :images

  resources :buckets, except: [:new]
  get "buckets/new/:sneaker_id", to: "buckets#new", as: 'new_bucket'
  get "bucketsempty", to: "buckets#newempty", as: "new_empty_bucket"
  # post "buckets/createempty", to: "buckets#createempty", as: "create_empty_bucket"

   resources :pins, except: [:destroy]
   delete "pins/:id/:bucket_id", to: "pins#destroy"

    post  "/pins/:id/stockwatch", to: 'pins#create_stock_watch', as: "stockwatch"

get "/modal/:sneaker_id", to: "pages#show_modal",as: "modal"

  resources :sneakers do
    resources :vendors
  end

  get 'homepage_notifications/read', to: 'homepage_notifications#read'


  get "sneakers/admin/index", to: "sneakers#admin"
  get "sneakers/admin/:id", to: "sneakers#admin_show", as: "sneakers_admin_show"
  get "sneakers/admin/:id/update", to: "sneakers#sneaker_update", as: "sneakers_admin_update"
  get "sneakers/admin/update/all", to: "sneakers#sneaker_update_all", as: "sneakers_admin_update_all"


  resources :logos, only: [:new, :create, :index]
  resources :brands, only: [:new, :create, :index]
  root to: 'pages#home'

  delete "logout" => "devise/sessions#destroy", :as => "logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
