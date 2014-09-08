class RemoveInvoceNumberFromInvoces < ActiveRecord::Migration
  def change
    remove_column :invoces, :invoce_number, :integer
  end
end
