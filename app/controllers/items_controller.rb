class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy, :purchase_confirmation, :purchase]
  
  require 'payjp'
  
  def index
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = "商品を出品しました"
      redirect_to mypage_path
    else
      render :new
    end
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def show
    @user = User.find(@item.saler_id)
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "商品を編集しました"
      redirect_to mypage_path
    else
      render 'items/edit'
    end
  end

  def destroy
    @item = Item.new
    if @item.destroy
      flash[:notice] = "商品を削除しました"
      redirect_to mypage_path
    else
      flash[:notice] = "商品の削除に失敗しました"
      render :show
    end
  end

  def purchase_confirmation
    @buyer = Profile.find_by(user_id: current_user.id)
    @buyer_prefecture = Prefecture.find_by(id: @buyer.prefectures)

    card = Credit.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "credit", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card_info = customer.cards.retrieve(card.card_id)
    end
  end

  def purchase
    card = Credit.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
    Payjp::Charge.create(
    amount: @item.price, 
    customer: card.customer_id,
    currency: 'jpy'
  )
  redirect_to action: 'complete_purchase'
  end

  def complete_purchase
  end


  private
  
  def item_params
    params[:item].permit(:id, :name, :image, :price, :status, :pay_way, :deliver_way, :deliver_date, :deliver_fee, :detail).merge(saler_id: current_user.id,situation: "sale")
    # :categorie_idは後々
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
