Rails.application.routes.draw do

  resources :academics
  resources :interests
  resources :groups do
  	member do
  		get :invite
  		post :add
  		get :member
  	end
  	resources :group_articles
  	resources	:group_questions
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

resources :domains, only: [:create,:new]
 
 resources :users
 resources :articles, only: [:create,:new]
 resources :questions
 resources :answers
end
