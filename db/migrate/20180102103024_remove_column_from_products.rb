class RemoveColumnFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :buy_now, :string
  end
end
