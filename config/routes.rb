Rails.application.routes.draw do
  resources :articles
  get 'tripmaps/trips'

  get 'tripmaps/fish'

  get 'tripmaps/pictures'

  resources :rewards
  resources :manufacturers do  
    get :autocomplete_manufacturer_name, on: :collection
  end
  resources :baits do  
    get :autocomplete_bait_name, on: :collection
  end
  resources :trophies
  resources :fish do  
    get :autocomplete_fish_name, on: :collection
  end
  resources :places do  
    get :autocomplete_place_name, on: :collection
  end
  resources :routes
  resources :trips do  
    get :autocomplete_trip_name, on: :collection
  end
  resources :commands
  resources :pictures
  get 'index/index'

  devise_for :users, :controllers => { :registrations => "users/registrations" }, :path_prefix => 'd'

  
  resources :users do  
    get :autocomplete_user_nickname, on: :collection
  end

  post "add_user_path", to: "trips#add_user"
  post "delete_user_path", to: "trips#delete_user"
  post "add_command_user_path", to: "commands#add_user"
  post "delete_command_user_path", to: "commands#delete_user"
  post "select_place_path", to: "trips#select_place"
  post "create_trophy_path", to: "trips#create_trophy"
  post "save_picture_path", to: "pictures#save_picture"

  get "get_fish", to: "fish#json"
  get "get_bait", to: "bait#json"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  resources :users, only: [:show]

  resources :trips do
    resources :pictures
  end

  mount Commontator::Engine => '/commontator'

  # You can have the root of your site routed with "root"
   root 'index#index'

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
