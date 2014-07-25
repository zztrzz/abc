class AddOkulveyilToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :okulveyil, :string
  end
end
