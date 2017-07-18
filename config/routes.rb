Rails.application.routes.draw do


  devise_for :users, :path => 'accounts'



  resources :users, only: [:show]
  #    resources :buckets, except: [:show]
  #   resources :buckets, path: "", as: "bucket_show", only: [:show]
  # end

  resources :buckets, except: [:new]
  get "buckets/new/:sneaker_id", to: "buckets#new", as: 'new_bucket'

   resources :pins

    post  "/pins/:id/stockwatch", to: 'pins#create_stock_watch', as: "stockwatch"

get "/modal/:sneaker_id", to: "pages#show_modal",as: "modal"

  resources :sneakers do
    resources :vendors
  end

  resources :logos, only: [:new, :create, :index]
  resources :brands, only: [:new, :create, :index]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
