Rails.application.routes.draw do
  get 'searches/search'
  get 'relationships/create'
  get 'relationships/destroy'
  root to: 'homes#top'
  get '/home/about' => 'homes#about'
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

end
