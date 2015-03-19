class Order < ActiveRecord::Base
  belongs_to :user, inverse_of: :orders
  has_many :order_cats
  has_many :cats, through: :order_cats, inverse_of: :orders

  enum status: %w(ordered paid completed cancelled)

  def total_price
    order_cats.inject(0) do |total, transaction|
      total + (transaction.quantity * transaction.cat.price)
    end
  end
end
