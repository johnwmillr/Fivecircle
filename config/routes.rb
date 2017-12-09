Rails.application.routes.draw do
  devise_for :merchants, path: 'merchants', controllers: {sessions: "merchants/sessions", registrations:"merchants/registrations",passwords:"merchants/passwords"}
  devise_for :users, path: 'users', controllers: {sessions: "users/sessions", registrations:"users/registrations",passwords:"users/passwords", omniauth_callbacks:"users/omniauth_callbacks" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # root 'users#index'
  # scope :users/:user_id do
  #   resources :media
  # end
  
#   devise_scope :user do
#   get "/users/sign_in" => "sessions_controller"
# end

  resources :users, :only => [:show]
  resources :merchants, :only => [:show]
  resources :coupons # This makes the new user form work, but it's not what we want

  # get 'users/:id' => 'users/actions#show', :as => :user
  get 'users/:user_id/media' => 'media#index', :as => :user_media
  post 'users/:user_id/media' => 'media#create'
  get 'users/:user_id/media/new' => 'media#new', :as =>:new_user_medium
  get 'users/:user_id/media/:id/edit' => 'media#edit', :as => :edit_user_medium
  get 'users/:user_id/media/:id' => 'media#show', :as => :user_medium
  patch 'users/:user_id/media/:id' => 'media#update'
  put 'users/:user_id/media/:id' => 'media#update'
  delete 'users/:user_id/media/:id' => 'media#destroy'

  post 'users/checkin' => 'users#checkin'

  # get 'merchants/:id' => 'merchants/actions#show', :as => :merchant
  get 'merchants/:merchant_id/coupons' => 'coupons#index', :as => :merchant_coupons
  post 'merchants/:merchant_id/coupons' => 'coupons#create'
  get 'merchants/:merchant_id/coupons/new' => 'coupons#new', :as =>:new_merchant_coupon
  get 'merchants/:merchant_id/coupons/:id/edit' => 'coupons#edit', :as => :edit_merchant_coupon
  get 'merchants/:merchant_id/coupons/:id' => 'coupons#show', :as => :merchant_coupon
  patch 'merchants/:merchant_id/coupons/:id' => 'coupons#update'
  put 'merchants/:merchant_id/coupons/:id' => 'coupons#update'
  delete 'merchants/:merchant_id/coupons/:id' => 'coupons#destroy'
  
  post 'users/:user_id/checkin' => 'users#checkin', :as =>:user_checkin
  get 'users/:user_id/avail_coupons' => 'users#getCoupons', :as => :get_coupons
  post 'users/:user_id/sel_coupons' => 'users#selCoupons', :as => :sel_coupons
  # root :to => redirect('/users')

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  resources :users

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
