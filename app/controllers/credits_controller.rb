class CreditsController < ApplicationController

  require "payjp"


  def new
    card = Credit.where(session[:email])
    redirect_to action: "show" if card.exists?
  end


  def pay #payjpとCreditのデータベース作成
    Payjp.api_key = 'sk_test_1fc06ad12596877ef48d294c' # シークレットキー。流出厳禁。あとでcredentials.ymlに移す。
    if params['payjp-token'].blank?
      redirect_to action:"new"
    else
      customer = Payjp::Customer.create(
      email: session[:email], #セッションの中に入ってるの持ってきたりすんのかなあ？
      card: params['payjp-token']
      )
      @user = User.new(session[:user_params])
      @user.build_profile(session[:profile_attributes_after_delivery])
      if @user.save
        @card = Credit.create(user_id: @user.id, customer_id: customer.id, card_id: customer.default_card)
        session[:id] = @user.id
        redirect_to complete_signup_signup_index_path
      else
        render '/signup/registration'
      end
    end
  end


  # def delete #PayjpとCreditデータベースを削除
  #   card = Credit.where(user_id: current_user.id).first
  #   if card.blank?
  #   else
  #     Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     customer.delete
  #     card.delete
  #   end
  #     redirect_to action: "new"
  # end

end
