class AddIlToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :il, :string
  end
end
