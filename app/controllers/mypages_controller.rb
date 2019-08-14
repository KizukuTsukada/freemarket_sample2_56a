class MypagesController < ApplicationController

  before_action :set_category

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

  private

  def set_category
    @category = Category.all
  end  

end