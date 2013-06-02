Joggingo::Application.routes.draw do

  mount_opro_oauth

  resources :points
  resources :timings
  resources :tracks
  resources :users
  resources :session, :only => [:new, :create, :destroy]
  
  root :to => "home#index"

  get '/users/:id/tracks', :controller => 'users', :action => 'tracks'
  #match '/signup', to: 'users#new'
  match 'signup' => 'users#new', :as => :signup, :via => 'get'
  match 'signup' => 'users#create', :as => :signup, :via => 'post'
  match 'signin' => 'sessions#new', :as => :signin, :via => 'get'
  match 'signin' => 'sessions#create', :as => :signin, :via => 'post'
  match 'signout' => 'sessions#destroy', via: :delete

  match '/profile', to: 'users#show'
  match '/profile/tracks', to: 'users#tracks'
  match '/settings', to: 'users#edit'

  post '/mobile', to: 'tracks#create', :as => "mobile"



  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
