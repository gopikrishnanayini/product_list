class AddColumnFromCategories < ActiveRecord::Migration[5.1]
  def change
  	add_attachment :categories, :photo
  end
end
