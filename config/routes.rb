Rails.application.routes.draw do
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

  # resources :others, controller: :application

  #-------- Tokyo

  post 'tokyo/approaching' , to: 'tokyo#approaching'
  post 'tokyo/stop_vibration' , to: 'tokyo#stop_vibration'
  get 'tokyo/to_vibrate.json' , to: 'tokyo#to_vibrate'
  get 'tokyo/admin' , to: 'tokyo#admin'

  #-------- Nagoya

  post 'nagoya/approaching' , to: 'nagoya#approaching'
  post 'nagoya/stop_vibration' , to: 'nagoya#stop_vibration'
  get 'nagoya/to_vibrate.json' , to: 'nagoya#to_vibrate'
  get 'nagoya/admin' , to: 'nagoya#admin'

  #-------- Kyoto

  post 'kyoto/approaching' , to: 'kyoto#approaching'
  post 'kyoto/stop_vibration' , to: 'kyoto#stop_vibration'
  get 'kyoto/to_vibrate.json' , to: 'kyoto#to_vibrate'
  get 'kyoto/admin' , to: 'kyoto#admin'

  # match ':controller/:action', via: [ :get , :post , :patch ]

  get '/index' , to: 'application#index'
  root to: 'application#index'
end
