class AddAnswerIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :answer_id, :integer
    add_index :topics, :answer_id
  end
end
