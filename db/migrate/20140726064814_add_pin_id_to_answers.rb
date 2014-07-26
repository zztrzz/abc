class AddPinIdToAnswers < ActiveRecord::Migration
  def change
  	add_column :answers, :pin_id, :integer
    add_index :answers, :pin_id
  end
end
