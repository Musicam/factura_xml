class Invoce < ActiveRecord::Base
  belongs_to :invoced_company
  belongs_to :order_tye
  validates_presence_of :invoced_company_id
  validates_presence_of :order_type_id
end
