Rails.application.routes.draw do

  root "home#index"
 


 # deviseのカスタマイズコントローラ用ルーティン。新規登録時にしよう。
  devise_for :users,
  controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

 # signup(session)
  resources :signup, only:[:index] do
    collection do
      get 'registration'
      get 'sms_confirmation'
      get 'delivery_address'
      get 'pay_way'  # 入力が全て完了
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
  get "mypages/edit", to: "mypages#edit"

  resources :mypages, only:[:index, :show] do
    collection do
      get 'logout'
      get 'pay_way'
      get 'identification'
    end
  end

  root "home#index"
  
  # public/indexは後々ログイン時のルートに設定する。設定方法は後々調べる。
  get "public/index", to: "public#index"
  get 'search', to: 'search#index'


 # その他のルーティング
  resources :categories, only: [:index]
  resources :brands, only: [:index]
  resources :trade, only: [:index, :show]
  resources :items


end