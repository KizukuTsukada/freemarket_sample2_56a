class ItemsController < ApplicationController

  def index
  end
  
  def create
    @item = Item.new(item_params)
  end
  
  def new
  end
  
  def edit
  end
  
  def show
  end
  
  def update
  end
  
  def delete
  end

end
