class Cart < ActiveRecord::Base
  has_one :user, foreign_key: :current_cart_id
  has_many :line_items
  has_many :items, through: :line_items

  def total
    count = 0
    line_items.each do |line_item|
      added_value = line_item.quantity * line_item.item.price
      count += added_value
    end
    count
  end

  def add_item(new_item_id)
    if items.include?(Item.find_by(id: new_item_id))
      current_line_item = LineItem.find_by(item_id: new_item_id)
      new_quantity = current_line_item.quantity + 1
      current_line_item.update(quantity: new_quantity)
      current_line_item
    else
      LineItem.new(item_id: new_item_id, cart_id: self.id)
    end
  end
end
