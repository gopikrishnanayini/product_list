class AddAttachmentPhotoToCategories < ActiveRecord::Migration[5.1]
  def change
    add_attachment :categories, :image
  end
end
