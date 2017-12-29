class AddColumnToProducts < ActiveRecord::Migration[5.1]
  def change
  	add_column :products, :buy_now, :string
  end
end
