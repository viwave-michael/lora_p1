Rails.application.routes.draw do
  root 'welcome#index'
  
  scope '/1.0' do
    resources :devices, shallow: true do
      resources :paths do
        resources :positions
      end
      resources :roll_calls do
        resources :roll_call_answers
      end
      resources :help_calls do
        resources :help_call_answers
      end
    end

    resources :groups

    resources :device_groups, only: [:index, :new, :create]
    get 'device_groups/remove', to: 'device_groups#remove'
    delete 'device_groups', to: 'device_groups#destroy'

    resources :group_devices, only: [:index, :new, :create]
    get 'group_devices/remove', to: 'group_devices#remove'
    delete 'group_devices', to: 'group_devices#destroy'
  end

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
