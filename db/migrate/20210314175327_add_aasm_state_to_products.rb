class AddAasmStateToProducts < ActiveRecord::Migration[6.1]
  def change
  	add_column :products, :aasm_state, :string
  	add_column :products, :aasm_state_date, :date
  end
end
