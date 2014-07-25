class AddUnvanToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :unvan, :string
  end
end
