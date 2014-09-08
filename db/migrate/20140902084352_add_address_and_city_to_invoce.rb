class AddAddressAndCityToInvoce < ActiveRecord::Migration
  def change
    add_column :invoces, :address, :string
    add_column :invoces, :city, :string
  end
end
