class OrderType < ActiveRecord::Base
  has_many :invoces
end
