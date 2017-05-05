Rails.application.routes.draw do

  resources :notifications
  resources :relationships , only: [:create,:destroy]
  resources :interests, only: [:create,:destroy]
  resources :domains_articles
  resources :domains_questions
  resources :groups do
  	member do
  		get :prepopulate
  		get :invite
  		post :add
  		get :member
  	end
  	resources :group_articles do
  		member do 
  			get :collection
  		end
  		resources :grouparticlereplies
  	end
  	
  	resources	:group_questions do
	 resources :groupanswers do
	 		member do
	 			get :collection
	 		end
	 		resources :groupquestionreplies
	 end
 end
  end
  resources :search_products
  resources :replies
  mount Ckeditor::Engine => '/ckeditor'
 root 'static_pages#home' 
 get '/your_groups', to: 'users#index_group'
 get '/login', to: 'sessions#new'
 post '/login', to: 'sessions#create'
 #get 'groups/:id/invite', to: 'groups#invite'
 #post 'groups/:id/invite', to: 'groups#add'
 
 get '/signup', to: 'users#new'
 post '/signup', to: 'users#create'
 delete '/logout', to: 'sessions#destroy'
 
 get 'auth/:provider/callback', to: 'sessions#create_facebook'
 get 'auth/failure', to: redirect('/')
 
 get '/write', to: "users#write"
 
 	
resources :domains do
	member do
		get :manage
		get :manage_subset
		get :manage_superset
		get :prepopulatesubset
		post :addsubset
		post :removesubset
		get :prepopulatesuperset
		post :addsuperset
		post :removesuperset
		get :move
	end
end
 
 resources :users do
	member do
		post :image
		get :prepopulateinterest
		post :addinterest
		post :removeinterest
		get :interest
		get :prepopulateacademic
		post :addacademic
		post :removeacademic
		get :academic
		get :following,:followers
	end
 end 	
 resources :articles do
 	member do
 		get :collection
 		end
 		resource :articlereplies
 	end
 
 		
 resources :questions do
	 resources :answers do
	 		member do
	 			get :collection
	 		end
	 		resources :replies
	 end
 end
end
