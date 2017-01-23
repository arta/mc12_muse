Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments, shallow: true, only: [:create, :destroy]
  end

  root 'posts#index'
end
