class ItemsController < ApplicationController

  def index
  end
  
  def create
    @item = Item.new
    # @parents = Categorie.where(ancestry: nil)
    @item.photos.build
  end
  
  def new
    @item = Item.new
    # @parents = Categorie.where(ancestry: nil)
    @item.photos.build
  end
  
  def edit
  end
  
  def show
  end
  
  def update
  end
  
end
