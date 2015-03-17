class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_cats
  has_many :cats, through: :order_cats
end
