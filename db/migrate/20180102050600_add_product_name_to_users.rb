class AddProductNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :product_name, :string
  end
end
