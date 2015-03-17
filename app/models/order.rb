class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_cats
  has_many :cats, through: :order_cats


  def total_price
    order_cats.inject(0) do |total, transaction|
      total + (transaction.quantity * transaction.cat.price)
    end
  end
end
