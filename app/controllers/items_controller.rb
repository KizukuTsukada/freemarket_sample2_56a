class ItemsController < ApplicationController

  before_action :set_category, only: [:index, :show]

  def index
  end
  
  def create
    @item = Item.new(item_params)
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
    params[:item].permit(:name, :price, :status, :pay_way, :deliver_way, :deliver_data, :deliver_fee, :detail, photos_attributes: [:image]).merge(saler_id: current_user.id,situation: "販売中")
    # :categorie_idは後々
  end

  # def new_photo_params
  #   params[:photos].permit(:image)
  # end
end
