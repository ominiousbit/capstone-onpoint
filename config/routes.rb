RailsDevise::Application.routes.draw do
  resources :images
  resources :poimanages
  resources :passwords
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  get 'users/:id/approve'=> 'admins#approve_user', as: 'approve_user'
  get 'admins'=> 'admins#index', as: 'admins'
  get 'poimanages'=> 'poimanages#index'
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  get 'images' => 'images#index'
  get 'new_images' => 'images#new'
  get 'poi' => 'poi#index'
end