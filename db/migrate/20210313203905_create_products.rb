class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
    	t.belongs_to :makeup, index: true, foreign_key: true
    	t.string :size
    	t.string :shade
    	t.string :color
    	t.json :acquisition, null: false
      t.timestamps
    end
  end
end