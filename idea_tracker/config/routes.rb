IdeaTracker::Application.routes.draw do
  resources :statuses
  resources :settings

  get 'keywords/:keyword', to: 'ideas#index', as: :keyword

  match '/category/', :to => 'category#index', :as => :categories, :via => [:get]
  #get 'ideas/' => 'ideas#to_csv' 
  resources :category  
  resources :partners

  resources :ideas

  devise_for :users

  mount Commontator::Engine => '/commontator'
  get "comments/index"
  get "comments/show"
  get "comments/new"
  get "comments/edit"
  get "comments/delete"
  get "users/index"
  get "ideas/index"
  get "ideas/show"
  get "ideas/new"
  get "ideas/edit"
  get "ideas/delete"
  get "clients/index"
  get "clients/show"
  get "clients/new"
  get "clients/edit"
  get "clients/delete"
  resources :dashboard
  get "admin/setting"
  resources :admin

  resources :users do
    resources :ideas
       get 'sendemail', :on => :collection
       get 'to_csv', :on => :collection
       get 'to_csv_all', :on => :collection
  end

  root to: "home#index"
  match ':controller(/:action(/:id))', :via => [:get, :post]
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
