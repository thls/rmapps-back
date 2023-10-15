class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :cep, null: false, index: true
      t.string :state, null: false, index: true
      t.string :city, null: false, index: true
      t.string :district, null: false, index: true
      t.string :street, null: false, index: true
      t.integer :number, null: false

      t.belongs_to :company, index: true, foreign_key: true, null: false
      t.timestamps
    end
  end
end
