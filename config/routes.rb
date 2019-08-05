Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  
  # public/indexは後々ログイン時のルートに設定する。設定方法は後々調べる。
  get "public/index" => "public#index"
  
  get "users" => "users#index", as: :mypage
  resources :users, only:[:index, :edit, :show]
  
  resources :categories, only: [:index]
  resources :brands, only: [:index]
  resources :trade, only: [:show]
  resources :items do
    resources :comments, only: [:index, :create]
  end
  
end