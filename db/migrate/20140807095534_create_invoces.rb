class CreateInvoces < ActiveRecord::Migration
  def change
    create_table :invoces do |t|
      t.integer :invoced_company_id
      t.integer :order_type_id
      t.string :shop
      t.integer :quantity
      t.integer :invoce_number
      t.date :invocedate

      t.timestamps
    end
  end
end
