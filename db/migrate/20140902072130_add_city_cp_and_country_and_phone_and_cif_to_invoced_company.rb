class AddCityCpAndCountryAndPhoneAndCifToInvocedCompany < ActiveRecord::Migration
  def change
    add_column :invoced_companies, :city_cp, :string
    add_column :invoced_companies, :country, :string
    add_column :invoced_companies, :phone, :string
    add_column :invoced_companies, :cif, :string
  end
end
