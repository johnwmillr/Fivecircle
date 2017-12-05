Rails.application.routes.draw do
  devise_for :merchants, path: 'merchants', controllers: {sessions: "merchants/sessions", registrations:"merchants/registrations",passwords:"merchants/passwords"}
  devise_for :users, path: 'users', controllers: {sessions: "users/sessions", registrations:"users/registrations",passwords:"users/passwords"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # root 'users#index'
  # scope :users/:user_id do
  #   resources :media
  # end

  resources :users, :only => [:show]

  # get 'users/:id' => 'users/actions#show', :as => :user
  get 'users/:user_id/media' => 'media#index', :as => :user_media
  post 'users/:user_id/media' => 'media#create'
  get 'users/:user_id/media/new' => 'media#new', :as =>:new_user_medium
  get 'users/:user_id/media/:id/edit' => 'media#edit', :as => :edit_user_medium
  get 'users/:user_id/media/:id' => 'media#show', :as => :user_medium
  patch 'users/:user_id/media/:id' => 'media#update'
  put 'users/:user_id/media/:id' => 'media#update'
  delete 'users/:user_id/media/:id' => 'media#destroy'
  
  post 'users/:user_id/checkin' => 'user#update_chekin', :as =>:update_user_checkin
  
  # root :to => redirect('/users')

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
