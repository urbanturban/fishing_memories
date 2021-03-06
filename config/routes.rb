Rails.application.routes.draw do

  get 'home', to: 'static_pages#home'
  get 'maps/new'
  get 'points/new'
  get 'tackles/search/name', to: 'tackles#search_for_name', as: 'search_tackle_names'
  get '/autocomplete_tags', to: 'notes#autocomplete_tags', as: 'autocomplete_tags'
  get 'calendar', :to => 'calendars#show'

  devise_for :users

  resources :memories
  resources :notes do
    get 'tags/:tag', to: 'notes#index', as: :tag, on: :collection
    get 'tags', to: 'notes#index', as: :tags, on: :collection
  end
  resources :tackles
  resources :tackle_sets
  resources :ponds do
    resource :map
  end
  resources :places do
    resource :map
  end
  resources :points
  resources :lures
  resources :brands
  resources :categories
  resources :tackle_categories, controller: 'categories', type: 'TackleCategory' 
  resources :pond_categories, controller: 'categories', type: 'PondCategory'
  resources :tackle_set_categories, controller: 'categories', type: 'TackleSetCategory'
  resources :lure_categories, controller: 'categories', type: 'LureCategory'

  namespace :admin do
    root :to => "users#index"
    resources :users
  end

  root 'static_pages#home'

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
