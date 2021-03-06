Rails.application.routes.draw do
  devise_for :students
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
  root 'questions#setup'
  
  get '/', {:controller => "questions", :action => "setup"}
  get '/quiz', {:controller => "questions", :action => "bank"}
  get '/check', {:controller => "questions", :action => "check"}
  get '/app_customization', {:controller => "application", :action => "customizeForm"}
  post '/app_customization', {:controller => "application", :action => "customize"}
  
  #QUESTION DATABASE
  #Create
  get '/questions/new', {:controller => 'questions', :action => 'newForm'}
  post '/questions/new', {:controller => 'questions', :action => 'add'}
  
  #Read
  get '/questions', {:controller => 'questions', :action => 'index'} 
  
  #Update
  get '/questions/edit/:id', {:controller => 'questions', :action => 'editForm'}
  post '/questions/edit/', {:controller => 'questions', :action => 'edit'}
    
  #Delete
  get '/questions/delete/:id', {:controller => 'questions', :action => 'delete'}
  
  
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
