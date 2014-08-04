class AddDoctorIdToPin < ActiveRecord::Migration
  def change
    add_column :pins, :doctor_id, :integer
    add_index :pins, :doctor_id
  end
end
