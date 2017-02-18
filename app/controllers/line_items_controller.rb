class LineItemsController < ApplicationController
  helper_method :current_cart
  def create

    unless current_user.current_cart
      current_user.current_cart = Cart.create
    end

    current_user.current_cart.add_item(params[:item_id]).save
    current_user.current_cart.save
    current_user.save

    redirect_to cart_path(current_cart)
  end

  def current_cart
    current_user.current_cart
  end
end
