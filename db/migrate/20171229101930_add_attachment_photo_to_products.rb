class AddAttachmentPhotoToProducts < ActiveRecord::Migration[5.1]
  def change
    add_attachment :products, :photo
  end
end
