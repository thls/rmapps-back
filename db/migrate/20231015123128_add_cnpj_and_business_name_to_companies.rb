class AddCnpjAndBusinessNameToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :cnpj, :string, null: false
    add_column :companies, :business_name, :string, null: false

    # Add indexes for the cnpj and business_name columns
    add_index :companies, :cnpj, unique: true
    add_index :companies, :business_name
  end
end
