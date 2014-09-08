class InvocedCompany < ActiveRecord::Base

  has_many :invoces, dependent: :restrict_with_error
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :city_cp
  validates_presence_of :country
  validates_presence_of :phone
  validates_presence_of :cif
end
