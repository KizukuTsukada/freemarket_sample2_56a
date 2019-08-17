class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
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
  end

  def purchase
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    :amount => @product.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
  )
  end


  private
  
  def item_params
    params[:item].permit(:name, :image, :price, :status, :pay_way, :deliver_way, :deliver_data, :deliver_fee, :detail).merge(saler_id: current_user.id,situation: "販売中")
    # :categorie_idは後々
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
