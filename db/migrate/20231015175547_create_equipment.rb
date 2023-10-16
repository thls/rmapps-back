class CreateEquipment < ActiveRecord::Migration[7.1]
  def change
    create_table :equipment do |t|
      t.belongs_to :company, null: false, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.string :name, null: false
      t.string :serial_number, null: false, index: true
      t.date :acquisition_date, null: false

      t.timestamps
    end
  end
end
