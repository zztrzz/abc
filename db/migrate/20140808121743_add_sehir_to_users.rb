class AddSehirToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sehir, :string
  end
end
