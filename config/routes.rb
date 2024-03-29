Rails.application.routes.draw do

  resources :bookmarks, only: [:create]
  delete '/bookmarks', to: 'bookmarks#destroy'
  resources :votes, only: [:create]

  resources :institutes,only: [:index,:create,:destroy]
  resources :badgrouparticlerelations  ,only: [:create,:destroy]
  resources :grouparticlerelations  ,only: [:create,:destroy]
  resources :badgroupanswerrelations ,only: [:create,:destroy]
  resources :groupanswerrelations ,only: [:create,:destroy]

  resources :relationships , only: [:create,:destroy]
  resources :interests, only: [:create,:destroy]
  #resources :domains_articles
  #resources :domains_questions
  resources :groups, only: [:show, :new, :create, :index] do
  	member do
  		get :edit_image
			post :image
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
    resources	:group_questions,only: [:new,:create,:show] do
	     resources :groupanswers do
	 		   member do
	 			   get :collection
	 		   end
	 		   resources :groupquestionreplies
	     end
    end
  end

  resources :search_products,only: [:index]
  resources :replies
  mount Ckeditor::Engine => '/ckeditor'
  root 'static_pages#home'
  get '/check_existing_question', to: 'static_pages#check_existing'
  get '/search_question',to: 'static_pages#search_question'
  get '/nowhere', to: 'static_pages#dummy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  #get 'groups/:id/invite', to: 'groups#invite'
  #post 'groups/:id/invite', to: 'groups#add'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'

  get 'auth/:provider/callback', to: 'sessions#create_social'
  get 'auth/failure', to: redirect('/')

  get '/write', to: "users#write"


  resources :domains do
  	member do
  		get :edit_image
  		post :image
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


  resources :users, except: :new do
	  resources :notifications do
	 	  collection do
	 		  get :mark
	 		  get :old_notifications
	 	  end
	 	end
	  member do
  		get :about
  		get :bookmarks
  		get :followers
  		get :following
  		get :edit_password
  		get :edit_name
  		post :update_password
  		post :update_name
  		get :edit_image
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

  get 'users/:user_id/questions', to: 'questions#user_questions'

  resources :articles do
    resource :article_replies, only: [:create, :update, :edit, :destroy]
  end


  resources :questions do
	  resources :answers do
	 	  member do
	 			get :collection
	 		end
	 		resources :answer_replies
	  end
  end

end
