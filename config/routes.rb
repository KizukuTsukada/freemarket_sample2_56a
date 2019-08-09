Rails.application.routes.draw do

 # deviseのカスタマイズコントローラ用ルーティン。新規登録時にしよう。
  devise_for :users, 
  controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

resources :users, only:[:index, :show] do
  collection do
    # 新規登録
    get 'sms_confirmation'
    get 'delivery_address'
    get 'pay_way'
    get 'complete_signup'
    get 'add_credit'
  end
end

  root "home#index"
  
  # public/indexは後々ログイン時のルートに設定する。ログイン機能実装後に実装する。
  get "public/index", to: "public#index"

  get "mypages/edit", to: "mypages#edit"
  resources :mypages, only:[:index, :show]
  get "mypages", to: "mypages#index", as: :mypage
  resources :mypages, only:[:index, :show] do
    collection do
      get 'logout'
      get 'pay_way'
      get 'identification'
    end
  end

  resources :categories, only: [:index]
  resources :brands, only: [:index]
  resources :trade, only: [:index, :show]
  resources :items
end
