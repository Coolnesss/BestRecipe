Rails.application.routes.draw do
  get 'welcome/index'

  resources :users

  resources :recipe_ingredients

  resources :ingredients

  resources :recipes

  root 'welcome#index'

  get 'signup', to: 'users#new'
  resource :session, only: [:new, :create, :delete]
  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'
  get 'auth/:provider/callback', to: 'sessions#create_oauth'
  # get 'authFB/:provider/callback', to: 'sessions#create_facebook_oauth'
  # get 'authFB/:provider/callback', to: 'sessions#create_facebook_oauth'
  match 'authFB/:provider/callback' => 'sessions#create_facebook_oauth', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'authFB/failure', to: redirect('/'), via: [:get, :post]

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
