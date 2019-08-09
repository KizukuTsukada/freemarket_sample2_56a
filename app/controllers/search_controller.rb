class SearchController < ApplicationController
  def search
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%").order("id DESC").page(params[:page]).per(15)
    if params[:keyword] == ""
      redirect_to '/items/search?utf8=✓&keyword=+++'
    end
    if @items.count == 0
      @all_items = Item.limit(25).order("id ASC")
    end
  end
end