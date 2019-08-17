Rails.application.routes.draw do

  root "items#index"


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


 # items
  # まだidがないので仮で作成
  get "items/create", to: "items#create"
  post "items/pay", to: "items#pay"
  resources :items do
    collection do
      get 'purchase_confirmation'
      get 'buy'
      post 'purchase'
    end
  end


 # credits
  resources :credits, only: [:new, :show] do
    collection do
      post 'pay', to: 'credits#pay'
      post 'show', to: 'credits#show'
    end
  end



 # public/indexは後々ログイン時のルートに設定する。ログイン機能実装後に実装する。
  get "public/index", to: "public#index"


 # その他のルーティング
  resources :categories, only: [:index]
  resources :brands, only: [:index]
  resources :trade, only: [:index, :show]

end