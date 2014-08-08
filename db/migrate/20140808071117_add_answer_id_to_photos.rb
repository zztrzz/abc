class AddAnswerIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :answer_id, :integer
  end
end
