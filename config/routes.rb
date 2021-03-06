Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #devise_for :users
  devise_for :users, controllers: { registrations: "registrations" }

  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
  	resources :posts
  	resources :followers
  	resources :notifications
  end

  get 'search', to: "users#search"

  root 'welcome#index'
  #root 'posts#new'
  match '*path' => redirect('/'), via: :get
end
