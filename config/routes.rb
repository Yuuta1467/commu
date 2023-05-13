Rails.application.routes.draw do

  namespace :public do
    get 'liles/create'
    get 'liles/destroy'
  end
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  scope module: :public do
    root to: "homes#top"

    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :edit, :update, :destroy] do
        resource :likes, only: [:create, :destroy]
      end
    end

    resources :users, only: [:show, :edit, :update,] do
      member do
        get :favorites
      end
    end

    get 'users/:id/check' => 'users#check', as:'check'
    patch 'users/:id/withdraw' => 'users#withdraw', as:'withdraw'

    get '/search', to: 'searches#search'

    post '/posts/guest_sign_in', to: 'posts#guest_sign_in'

  end

  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
    root to: "homes#top"

    resources :posts, only: [:index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:index, :show, :edit, :update, :destroy]
    end

    resources :tags, only: [:index, :create, :edit, :update]

    resources :users, only: [:index, :show, :edit, :update]

  end

  #namespace :admin do
    #get 'users/index'
    #get 'users/show'
    #get 'users/edit'
  #end
  #namespace :admin do
    #get 'tags/index'
    #get 'tags/edit'
  #end
  #namespace :admin do
    #get 'posts_comments/index'
    #get 'posts_comments/show'
    #get 'posts_comments/edit'
  #end
  #namespace :admin do
    #get 'posts/index'
    #get 'posts/show'
    #get 'posts/edit'
  #end
  #namespace :admin do
    #get 'homes/top'
  #end
  #namespace :public do
    #get 'searches/searh'
  #end
  #namespace :public do
    #get 'post_comments/edit'
  #end
  #namespace :public do
    #get 'users/show'
    #get 'users/edit'
    #get 'users/check'
  #end
  #namespace :public do
    #get 'posts/new'
    #get 'posts/create'
    #get 'posts/index'
    #get 'posts/show'
    #get 'posts/edit'
    #get 'posts/update'
    #get 'posts/destroy'
  #end
  #namespace :public do
    #get 'homes/top'
  #end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end