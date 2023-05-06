Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'tags/index'
    get 'tags/edit'
  end
  namespace :admin do
    get 'posts_comments/index'
    get 'posts_comments/show'
    get 'posts_comments/edit'
  end
  namespace :admin do
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'searches/searh'
  end
  namespace :public do
    get 'post_comments/edit'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/check'
  end
  namespace :public do
    get 'posts/new'
    get 'posts/create'
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
    get 'posts/update'
    get 'posts/destroy'
  end
  namespace :public do
    get 'homes/top'
  end
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end