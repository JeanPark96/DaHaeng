Rails.application.routes.draw do

  devise_for :users,:controllers => { :registrations => "registrations" }
  resources :review
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  #resources :users
  root 'home#index'
  get 'reviews/review' => 'reviews#review'
  get 'home/together', to:'home#together'
  get 'home/together2', to:'home#together2'
  get 'home/safety', to:'home#safety'
 
  get '/reviews/review_new' 
  post '/reviews/update' => 'reviews#update'
  get '/reviews/update' => 'reviews#update'
  get '/reviews/review_create'
  get '/reviews/update'
#  get 'reviews/:id' => 'reviews#show'
  get 'reviews/:id' => 'reviews#index'
  get '/reviews/review_create' => 'reviews#create'
  post '/reviews/review_create' => 'reviews#create'
  get '/reviews/index'  => 'reviews#index'
  get '/reviews/review' => 'reviews#index'
  post '/update' => 'reviews#update'
  get 'home/lang', to: 'home#lang'
  get 'home/trav', to: 'home#trav'
  get 'home/vol', to: 'home#vol'

end
