class AddPhotoIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :photo_id, :integer
  end
end
