Rails.application.routes.draw do

  devise_for :users,:controllers => { :registrations => "registrations" }
  resources :review,:together
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  #resources :users
  root 'home#index'
  get 'reviews/review' => 'reviews#review'


  get 'home/safety', to:'home#safety'
  get 'api/index',to:'api#index'
  get '/reviews/review_new' 
   get '/reviews/index'  => 'reviews#index'

  get '/reviews/review_create'
  get '/reviews/update'
  # get '/reviews/destroy'
  get '/reviews' => 'reviews#index'
  get 'reviews/:id' => 'reviews#show'
  # get '/reviews/:id' => 'reviews#index'
  # get '/reviews/:id' => 'reviews#destroy'
  # get '/reviews/destroy' => 'reviews#destroy'
  get '/reviews/review_create' => 'reviews#create'
  post '/reviews/review_create' => 'reviews#create'

  get '/reviews/destroy/:id' => 'reviews#destroy'

  # get '/reviews/:id' => 'reviews#destroy'
  get '/reviews/review' => 'reviews#index'
  post '/update' => 'reviews#update'
  get 'home/lang', to: 'home#lang'
  get 'home/trav', to: 'home#trav'
  get 'home/vol', to: 'home#vol'
  get 'home/profile', to: 'home#profile'
  get '/langs' => 'langs#index'
  

  get '/togethers/together_new'
  
  get '/togethers/index'=>'togethers#index'
  
  
  get '/togethers/together_new' => 'togethers#create'
   post '/togethers/together_new' => 'togethers#create'
 # get '/together/show'=>'together#show'

      get '/togethers/:id' => 'togethers#show'


end
