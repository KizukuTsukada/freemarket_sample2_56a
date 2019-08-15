class HomeController < ApplicationController

  before_action :set_category

  def index
  end

  private

  def set_category
    @category = Category.alls
  end  

end