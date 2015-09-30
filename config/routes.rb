Rails.application.routes.draw do

  resources :cities
  resources :orders
  root 'store#index'

  get "home" => 'pages#home'

  get "about" => 'pages#about'

  get "faqs" => 'pages#faqs'

  get "contact" => 'pages#contact'

  get "help" => 'pages#help'

  get "signup" => 'customers#new'

  get "login" => 'sessions#new'

  post "login" => 'sessions#create'

  delete "logout" => 'sessions#destroy'
  
  get "/store/:id" => 'store#show', as: :store_product

  get 'search_results' => 'store#search_results'

  resources :customers do
    member do
      get :remove_photo
    end
  end
  resources :products
  resources :categories
  resources :line_items
  resources :carts

  # get 'customer/:id/remove_photo' => 'customers#remove_photo', as: :remove_photo

  # get 'line_item/:id/remove_item' => 'line_items#remove_item', as: :remove_item

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  # 
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
  #     #   end
end
