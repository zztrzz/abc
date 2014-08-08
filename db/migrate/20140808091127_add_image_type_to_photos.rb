class AddImageTypeToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :image_type, :integer
  end
end
