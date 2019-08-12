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
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%").order("id ASC")
    if params[:keyword] == ""
      redirect_to '/items/search?utf8=✓&keyword=+++'
    end
    if @items.count == 0
      @all_items = Item.limit(20).order("id ASC")
    end
    @products = []
  end
end