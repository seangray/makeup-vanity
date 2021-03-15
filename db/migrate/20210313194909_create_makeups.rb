class CreateMakeups < ActiveRecord::Migration[6.1]
  def change
    create_table :makeups do |t|
    	t.string :brand
    	t.string :name
    	t.string :category
    	t.integer :rating
    	t.text :review
    	t.boolean :repurchase, default: false, null: false
      t.timestamps
    end
  end
end
