Rails.application.routes.draw do

  devise_for :users,:controllers => { :registrations => "registrations" }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  #resources :users
  root 'home#index'
  get 'home/review' => 'home#review'
  get 'home/together', to:'home#together'
  get 'home/together2', to:'home#together2'
  get 'home/safety', to:'home#safety'
  get 'home/review_new' => 'home#review_new'
  post 'home/review_create' => 'home#review_create'
  get 'home/lang', to: 'home#lang'
  get 'home/trav', to: 'home#trav'
  get 'home/vol', to: 'home#vol'

end
