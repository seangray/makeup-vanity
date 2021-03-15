class AddUniqueIndexToMakeups < ActiveRecord::Migration[6.1]
  def change
  	add_index :makeups, [:brand, :name], unique: true
  end
end
