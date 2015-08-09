Rails.application.routes.draw do

  resources :preference_types

  resources :preferences

  resources :restaurants

  resources :events do
    resources :sub_events
    get '/sub_events/:id/sign_up', to: 'sub_events#sign_up', as: :sign_up
  end

  get '/users/approve_users'

  match 'admin/users/:id/approve', :to => 'users#approve', :as => 'admin_user_approve', :via => :post

  #need to route user ID and sub event ID to sign up in the sub_events controller

  resources :event_types

  root 'users#dashboard'

  #devise_for :users

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users do
    resources :volunteer_notes
  end

  scope "/admin" do
    resources :users
  end
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
