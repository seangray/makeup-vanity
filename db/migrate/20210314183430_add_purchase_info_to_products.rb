class AddPurchaseInfoToProducts < ActiveRecord::Migration[6.1]
  def change
  	remove_column :products, :acquisition

  	add_column :products, :purchase_date, :date
  	add_column :products, :repurchase, :boolean, default: false, null: false
  	add_column :products, :planned, :boolean, default: false, null: false
  	add_column :products, :online, :boolean, default: false, null: false
  	add_column :products, :price, :numeric
  	add_column :products, :retailer, :string
  	add_column :products, :rating, :integer
  	add_column :products, :review, :text

  	add_index  :products, :price
  end
end
