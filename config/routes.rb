Rails.application.routes.draw do
  resources :comments

  resources :posts do
    resources :comments

    member do
    put "like", to: "posts#upvote"
    put "dislike", to: "posts#downvote"
    end
  end

  get 'static_pages/contact' => 'static_pages#contact', as: 'contact'

  get 'static_pages/about' => 'static_pages#about', as: 'about'

  get 'sessions/login'

  get 'sessions/logout' => 'sessions#logout', as: 'sessions_logout'

  post 'sessions' => 'sessions#create'

  #get 'users/new'

  resources :posts

  #GET   /posts  posts#index  display a list of all posts
  #GET   /posts/new   posts#new  return an HTML form for creating a new photo
  #POST  /posts   posts#create   create a new photo
  #GET   /posts/:id   posts#show   display a specific photo
  #GET   /posts/:id/edit  posts#edit   return an HTML form for editing a photo
  #PATCH/PUT   /posts/:id   posts#update   update a specific photo
  #DELETE  /posts/:id   posts#destroy  delete a specific photo
  
  get 'registration' => 'users#new', as: 'registration'  # = get 'registration' => 'users#new'

  post 'users' => 'users#create'

  get 'users/:id' => 'users#show'

  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'posts#index'

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
