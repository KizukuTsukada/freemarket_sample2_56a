class ItemsController < ApplicationController

  def index
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
    @items = Item.where(id: params[:id])
  end
  
  def update
  end

  private
  
  def item_params
    params[:item].permit(:name, :price, :status, :pay_way, :deliver_way, :deliver_data, :deliver_fee, :detail ).merge(saler_id: current_user.id,situation: "販売中")
    # :categorie_idは後々
  end

  def new_photo_params
    params[]
  end
end
