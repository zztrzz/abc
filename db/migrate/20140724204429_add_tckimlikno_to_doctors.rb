class AddTckimliknoToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :tckimlikno, :integer
  end
end
