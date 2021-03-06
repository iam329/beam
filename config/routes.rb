MusicblogApp::Application.routes.draw do
  
  #created when controller is generated
  get "likes/create"
  get "likes/destroy"
  
  #created when controller is generated
  get "relationships/create"
  get "relationships/destroy"
  
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :posts, only: [:new, :create, :destroy]

  resources :sessions, only: [:new, :create, :destroy]

  resources :relationships, only: [:create, :destroy]

  resources :likes, only: [:create, :destroy]

  root to: 'static_pages#home'
  match '/about', to:'static_pages#about', via: 'GET'
  match '/trending', to: 'static_pages#trending', via: 'GET'

  match '/signin', to: 'sessions#new', via: 'GET'
  match '/logout', to: 'sessions#destroy', via: 'DELETE'

  match '/signup', to: 'users#new', via: 'GET'
  get '/:name', to: 'users#show', as: :profile, :constraints => {:name => /[A-Za-z0-9\.]+?/, :format => /html/}

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
