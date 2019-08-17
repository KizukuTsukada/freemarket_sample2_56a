class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :destroy]
  
  def index
  end

  def create
    @item = Item.new(item_params)
    @item.photos.build

    if @item.save
      flash[:notice] = "商品を出品しました"
      redirect_to mypage_path
    else
      render :new
    end
  end

  def new
    @item = Item.new
    @item.photos.build
  end

  def edit
  end

  def show
    @items = Item.where(id: params[:id])
    @user = User.find(@item.saler_id)
    @image = @item.photos[0].image
  end

  def update
  end

  def destroy
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
    params[:item].permit(:name, :price, :status, :pay_way, :deliver_way, :deliver_data, :deliver_fee, :detail ).merge(saler_id: current_user.id,situation: "販売中")
    # :categorie_idは後々
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
