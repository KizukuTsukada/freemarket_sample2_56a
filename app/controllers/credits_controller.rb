class CreditsController < ApplicationController

  require "payjp"


  def new
    card = Credit.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end


  def create #payjpとCreditのデータベース作成
    Payjp.api_key = 'sk_test_1fc06ad12596877ef48d294c' # シークレットキー。流出厳禁。みんな注意。あとでcredentials.ymlに移す。
    if params['payjp-token'].blank?
      redirect_to registration_signup_index_path, id: current_user.id
    else
      customer = Payjp::Charge.create(
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Credit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to complete_signup_signup_index_path
      else
        redirect_to pay_way_signup_index_path
      end
    end
  end


  def show #Creditのデータをpayjpに送り情報を取り出す
    card = Credit.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = 'sk_test_1fc06ad12596877ef48d294c'
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
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
