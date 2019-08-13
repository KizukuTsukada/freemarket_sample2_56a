class ItemsController < ApplicationController

  def index
  end
  
  def create
    @item = Item.new
    # @parents = Categorie.where(ancestry: nil)
    @item.photos.build

    if @item.save && new_image_params[:images][0] != ""
      new_image_params[:images].each do |image|
        @item.item_images.create(image: image, item_id: @item.id)
      end
      redirect_to root_path
    else
      @item.item_images.build
      render :new
    end
  end
  
  def new
    @item = Item.new
    # @parents = Categorie.where(ancestry: nil)
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
    params[:item].permit(:name, :price, :status, :pay_way, :deliver_way, :deliver_date, :deliver_fee, :detail, :situation, :categorie_id ).merge(seller_id: current_user.id)
  end

  def new_image_params
    params[:new_photos].permit({photos: []})
  end
end
