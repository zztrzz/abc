class AddSchoolToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :school, :string
  end
end
