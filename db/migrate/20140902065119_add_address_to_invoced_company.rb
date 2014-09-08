class AddAddressToInvocedCompany < ActiveRecord::Migration
  def change
    add_column :invoced_companies, :address, :string
  end
end
