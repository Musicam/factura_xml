class CreateInvoces < ActiveRecord::Migration
  def change
    create_table :invoces do |t|
      t.integer :id_order_type
      t.integer :id_order_type
      t.string :shop
      t.integer :quantity
      t.integer :invoce_number
      t.date :invocedate

      t.timestamps
    end
  end
end
