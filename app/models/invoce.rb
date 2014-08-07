class Invoce < ActiveRecord::Base
  belongs_to :invoced_company
  belongs_to :order_tye
end
