Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  
  # public/indexは後々ログイン時のルートに設定する。設定方法は後々調べる。
  get "public/index" => "public#index"
  
  get "users" => "users#index", as: :mypage
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  
  get "categories/index" => "categories#index"
  get "brands/index" => "brands#index"
  get "trade/id" => "trade#show"
  resources :items do
    resources :comments, only: [:index, :create]
  end
  
end