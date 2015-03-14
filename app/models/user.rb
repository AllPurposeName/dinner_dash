class User < ActiveRecord::Base
  has_secure_password
  has_many :orders

  enum role: %w(default admin)
end
