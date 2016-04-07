Rails.application.routes.draw do
  # GET MEETUP EVENTS
  # match ':controller(/:action(/:id(.:format)))', via: :get # WORKING
  # match ':controller(/:action(/:id(.:format)))', via: :get
  # match ':events/:update_states/(:id)', via: :get
  # match ':addresses(/:create(/:id(.:format)))', via: :get
  # get => ':addresses(/:create(/:id(.:format)))' => 'events#update_states'

  get 'events/update_states'
  get 'events/update_cities'
  # ROOT OF THE APPLICATION
  root 'welcome#index'
  # AUTHENTICATION FOR THE APP
  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  # WELCOME CONTROLLER ROUTES
  # resources :welcome, only: [:index, :show]

  # ADDRESS CONTROLLER ROUTES

  # CALENDAR ROUTES
  # resources :calendars, only: [:index]

  # EVENT ROUTES
  resources :events do
    member do
      get :index_calendar
    end
    collection do
      get :city
    end
    resources :addresses, only: [:create] do
      # collection do
      #   get :update_states
      #   get :update_cities
      # end
    end
  end

  get 'welcome/index_oauth', as: :index_oauth
  # EVENT ORGANIZATIONS
  # resources :organizations
  # EVENT UNITS
  # resources :units
  # EVENT UNIT TYPES
  # resources :unit_types
  # ORGANIZATION EVENTS
  # resources :organization_events
  # EVENT CATEGORIES
  # resources :event_categories

  resources :users_admin, only: [:update_role] do
    member do
      get :update_role
      put :update_role
    end
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
