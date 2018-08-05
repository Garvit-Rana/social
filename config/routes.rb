require 'resque/server'




Rails.application.routes.draw do
 

 mount Resque::Server.new,at: "/resque"
 
namespace :api do
namespace :v1 do
get 'post/home',to: 'posts#home'
post 'user/sign_in',to: 'users#sign_in'
post 'posts/create',to: 'posts#create'
end
namespace :v2 do
  get 'post/home',to: 'posts#home'
end
namespace :v3 do
get 'posts/index',to: 'posts#index'
post 'sign_in',to: 'posts#sign_in'
  end
end
  get 'users/profile/:id',to: 'users#profile'
  get 'users/search',to: 'users#user_search'

  post 'users/update/:id',to: 'users#upload',as: :users_upload

  post 'likes/toggle/:post_id',to: 'likes#toggle',as: :toggle_like

  post 'comments/create',as: :comments 

  delete 'comments/:id',to: 'comments#destroy',as: :destroy_comments

  root 'posts#home'
get 'post/home',to: 'posts#home'
  post 'posts/create',as: :posts

  delete 'posts/:id', to: 'posts#destroy',as: :destroy_post

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
