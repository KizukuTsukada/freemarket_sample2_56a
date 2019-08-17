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
    @image = @item.photos[0].image
  end
  
  def show
    @items = Item.where(id: params[:id])
    @user = User.find(@item.saler_id)
    @image = @item.photos[0].image
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
    @item.photos.build
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

  def buy
  end

  def pay
    Payjp.api_key = 'sk_test_1fc06ad12596877ef48d294c'
    Payjp::Charge.create(
      amount: 3500, # 決済する値段 params[:price]
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end

  private
  
  def item_params
    params[:item].permit(:name, :price, :status, :pay_way, :deliver_way, :deliver_data, :deliver_fee, :detail, photos_attributes: :image).merge(saler_id: current_user.id,situation: "販売中")
    # :categorie_idは後々
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
