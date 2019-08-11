class ItemsController < ApplicationController

  def index
  end
  
  def create
  end
  
  def new
  end
  
  def edit
  end
  
  def show
  end
  
  def update
  end

  def search
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%").order("id ASC")
    if params[:keyword] == ""
      redirect_to '/items/search?utf8=✓&keyword=+++'
    end
    if @items.count == 0
      @all_items = Item.limit(25).order("id ASC")
  end
end
