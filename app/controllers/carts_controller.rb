require 'pry'
class CartsController < ApplicationController
  helper_method :current_cart

  def show
  end

  def checkout
    current_cart.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(params[:id])
  end


  def current_cart
    current_user.current_cart
  end
end
