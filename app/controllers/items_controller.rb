class ItemsController < ApplicationController

  def index
  end
  
  def create
  end
  
  def new
    @parents = Category.all.order("id ASC").limit(13)
  end
  
  def edit
  end
  
  def show
  end
  
  def update
  end
  
end
