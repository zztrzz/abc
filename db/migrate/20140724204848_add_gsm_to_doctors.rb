class AddGsmToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :gsm, :integer
  end
end
