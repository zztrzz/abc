class AddAreaofpracticeToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :aop, :string
  end
end
