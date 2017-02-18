class StoreController < ApplicationController
  helper_method :current_cart

  def index
    @categories = Category.all
    @items = Item.available_items
  end

  def current_cart
    current_user.current_cart
  end
end
