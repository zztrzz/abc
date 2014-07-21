class AddDiplomanoToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :licenseno, :integer
  end
end
