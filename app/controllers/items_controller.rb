class ItemsController < ApplicationController

  def index
  end
  
  def create
  end
  
  def new
    @parents = Category.all.order("id ASC").limit(4)
    # Categoriesテーブルの上から4個のレコードを取り出す
  end
  
  def edit
  end
  
  def show
  end
  
  def update
  end
  
end
