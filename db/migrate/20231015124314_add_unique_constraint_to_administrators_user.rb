class AddUniqueConstraintToAdministratorsUser < ActiveRecord::Migration[7.1]
  def change
    # Remove the existing index (if it exists)
    remove_index :administrators, :user_id if index_exists?(:administrators, :user_id)
    
    # Add a unique constraint to the user_id column
    change_column :administrators, :user_id, :bigint, null: false
    add_index :administrators, :user_id, unique: true
  end
end
