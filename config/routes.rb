Rails.application.routes.draw do

  root "home#index"


 # deviseのカスタマイズコントローラ用ルーティン。新規登録時にしよう。
  devise_for :users,
  controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    omniauth_callbacks:  "users/omniauth_callbacks"
  }

 # signup(session)
  get "signup", to: "signup#index"
  resources :signup do
    collection do
      get 'registration'
      post 'sms_confirmation'
      post 'delivery_address'
      post 'pay_way'  # 入力が全て完了
      get 'complete_signup'  #登録完了後
    end
  end


 # users
  resources :users, only:[:index, :show] do
    # 新規登録
    collection do
      # get 'sms_confirmation'
      # get 'delivery_address'
      # get 'pay_way'
      # get 'complete_signup'
      get 'add_credit'
    end
  end

 # mypages
  get "mypages", to: "mypages#index", as: :mypage
  # まだidがないので仮で作成
  get "mypages/edit", to: "mypages#edit"

  resources :mypages, only:[:index] do
    collection do
      get 'logout'
      get 'pay_way'
      get 'identification'
      get 'mylist'
    end
  end

  post "items/pay", to: "items#pay"
  resources :items do
    collection do
      get 'purchase_confirmation'
      get 'buy'
    end
  end

 # その他のルーティング
  resources :categories, only: [:index]
  resources :brands, only: [:index]
  resources :trade, only: [:index, :show]

end