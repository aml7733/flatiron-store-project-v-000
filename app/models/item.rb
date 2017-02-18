class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def self.available_items
    self.all.reject{ |item| item.inventory <= 0 }.map { |item| item }
  end
end
