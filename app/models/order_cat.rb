class OrderCat < ActiveRecord::Base
  belongs_to :order
  belongs_to :cat
end
