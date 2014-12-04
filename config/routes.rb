Rails.application.routes.draw do

  devise_for :admins
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"



  namespace :admin do
    resources :users
    resources :information
    resources :shops
    resources :categories
  end
  namespace :i do
    resources :shops do
       member do
           get 'display'
       end
       collection do
           get 'guide'
       end

    end
    resources :infos
    resources :information
    resources :activities
  end
  resources :users

  get 'shops/:id/information/:information_id' => 'shops#information', as: :information_shop
  resources :shops

  concern :commentable do
    resources :comments
  end

  resources :information, concerns: :commentable
  resources :information do
      member do
           get 'infomation'
           post 'like'
           patch 'commented'
      end
  end

  authenticated :admin do
    root to: "admin/information#index", as: :authenticated_admin_root
  end


  get '/about' => 'home#about', as: :about 
  post '/feedback' => 'home#feedback', as: :feedback 

  resources :chat

  root 'home#index'
  
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
