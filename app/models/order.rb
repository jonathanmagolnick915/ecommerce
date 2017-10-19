class Order < ApplicationRecord

	belongs_to :user

	serialize :order_items, Hash 

end
