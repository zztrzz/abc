class AddDoctorIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :doctor_id, :integer
    add_index :answers, :doctor_id
  end
end
