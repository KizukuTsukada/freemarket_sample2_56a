class ItemsController < ApplicationController

  def index
  end
  
  def create
    @item = Item.new
    # @parents = Category.where(ancestry: nil)
    @item.photos.build
  end
  
  def new
  end
  
  def edit
  end
  
  def show
  end
  
  def update
  end
  
end