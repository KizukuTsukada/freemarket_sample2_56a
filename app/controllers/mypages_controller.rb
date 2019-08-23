class MypagesController < ApplicationController

  before_action :set_categories

  def index
  end

  def edit
  end

  def show
  end

  def logout
  end

  def pay_way
  end

  def identification
  end

  def mylist
    @items = Item.where(saler_id: current_user.id)
  end

  def set_categories
    @categories = Category.all
  end

end