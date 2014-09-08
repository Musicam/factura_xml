class OrderType < ActiveRecord::Base
  has_many :invoces, dependent: :restrict_with_error
  validates :name, :presence => true
end
