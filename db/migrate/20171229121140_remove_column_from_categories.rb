class RemoveColumnFromCategories < ActiveRecord::Migration[5.1]
  def change
  	remove_attachment :categories, :image
  end
end
