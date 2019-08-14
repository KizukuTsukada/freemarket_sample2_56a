class ItemsController < ApplicationController

  def index
    @products = Product.order('id ASC').limit(20)
  end
  
  def create
    @item = Item.new(item_params)
    @item.photos.build

    if @item.save
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
    @product = Product.find(params[:id])
    @items = Item.where(id: params[:id])
  end
  
  def update
  end

  def search
    @search_items = Item.where('name LIKE(?)', "%#{params[:search]}%").order("id ASC")
    logger.debug @search_items[0].inspect
  end
end

  private
  def item_params
    params[:item].permit(:name, :price, :status, :pay_way, :deliver_way, :deliver_data, :deliver_fee, :detail ).merge(saler_id: current_user.id,situation: "販売中")
    # :categorie_idは後々
  end

