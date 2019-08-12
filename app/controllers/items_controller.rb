class ItemsController < ApplicationController

  def index
    @products = Product.order('id ASC').limit(20)
  end
  
  def create
  end
  
  def new
  end
  
  def edit
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def update
  end

  def search
    @search_items = Item.where('name LIKE(?)', "%#{params[:keyword]}%").order("id ASC")
    logger.debug "**********"
    logger.debug @search_items[0].inspect
    logger.debug "**********"
  end
end