class AddDoctorIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :doctor_id, :integer
  end
end
