Rails.application.routes.draw do

 # deviseのカスタマイズコントローラ用ルーティン。新規登録時にしよう。
  devise_for :users, 
  controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

resources :users, only:[:index, :show] do
  collection do
    get 'sms_confirmation'
    get 'delivery_address'
    get 'pay_way'
    get 'complete_signup'
  end
end

  root "home#index"
  
  # public/indexは後々ログイン時のルートに設定する。設定方法は後々調べる。
  get "public/index" => "public#index"

  get "mypage" => "mypage#index", as: :mypage
  resources :users, only:[:edit, :show]  
  resources :categories, only: [:index]
  resources :brands, only: [:index]
  resources :trade, only: [:index, :show]
  resources :items
end
