class CreditsController < ApplicationController

  require "payjp"

  def new
    card = Credit.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay # payjpでの決済用アクション
    Payjp.api_key = 'sk_test_1fc06ad12596877ef48d294c' # シークレットキー。流出厳禁。
    if params['payjp-token'].blank?
      redirect_to registration_signup_index_path, id: current_user.id
    else
      customer = Payjp::Charge.create(
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end


end
