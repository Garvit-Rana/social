Rails.application.routes.draw do
 
namespace :api do
namespace :v1 do
get 'post/home',to: 'posts#home'
post 'user/sign_in',to: 'users#sign_in'
post 'posts/create',to: 'posts#create'
end
namespace :v2 do
  get 'post/home',to: 'posts#home'
end
end
  get 'users/profile/:id',to: 'users#profile'

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
