class AddImageToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :image, :string
  end
end
