class CreateInvocedCompanies < ActiveRecord::Migration
  def change
    create_table :invoced_companies do |t|
      t.string :name

      t.timestamps
    end
  end
end
