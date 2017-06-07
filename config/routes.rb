Rails.application.routes.draw do

  namespace :admin do
    resources :academics
    resources :answers
    resources :answer_bookmark_relations
    resources :answerrelations
    resources :articles
    resources :article_bookmark_relations
    resources :articlerelations
    resources :articlereplies
    resources :associated_sets
    resources :badanswerrelations
    resources :badarticlerelations
    resources :badgroupanswerrelations
    resources :badgrouparticlerelations
    resources :domains
    resources :domains_articles
    resources :domains_questions
    resources :groups
    resources :group_articles
    resources :group_questions
    resources :groupanswers
    resources :groupanswerrelations
    resources :grouparticlerelations
    resources :grouparticlereplies
    resources :groupquestionreplies
    resources :groups_users
    resources :institutes
    resources :interests
    resources :notifications
    resources :questions
    resources :question_bookmark_relations
    resources :relationships
    resources :replies
    resources :search_products
    resources :users

    root to: "users#index"
  end

  resources :institutes,only: [:index,:create,:destroy]
  resources :answer_bookmark_relations
  resources :question_bookmark_relations ,only: [:create,:destroy]
  resources :article_bookmark_relations ,only: [:create,:destroy]
  resources :badanswerrelations  ,only: [:create,:destroy]
  resources :answerrelations ,only: [:create,:destroy]
  resources :badgrouparticlerelations  ,only: [:create,:destroy]
  resources :grouparticlerelations  ,only: [:create,:destroy]
  resources :badgroupanswerrelations ,only: [:create,:destroy]
  resources :groupanswerrelations ,only: [:create,:destroy]
  resources :badarticlerelations ,only: [:create,:destroy]
  resources :articlerelations ,only: [:create,:destroy]

  resources :relationships , only: [:create,:destroy]
  resources :interests, only: [:create,:destroy]
  #resources :domains_articles
  #resources :domains_questions
  resources :groups,only: [:show,:new,:create] do
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
 get '/your_groups', to: 'users#index_group'
 get '/login', to: 'sessions#new'
 post '/login', to: 'sessions#create'
 #get 'groups/:id/invite', to: 'groups#invite'
 #post 'groups/:id/invite', to: 'groups#add'

 get '/signup', to: 'users#new'
 post '/signup', to: 'users#create'
 delete '/logout', to: 'sessions#destroy'

 get 'auth/facebook/callback', to: 'sessions#create_facebook'
 get 'auth/google_oauth2/callback',to: 'sessions#create_google'
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

 resources :users do
	resources :notifications do
	 	collection do
	 		get :mark
	 		get :old_notifications
	 	end
	 	end
	member do
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
