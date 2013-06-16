class AddFieldsToCalculations < ActiveRecord::Migration
  def change
    add_column :calculations, :weight, :integer
    add_column :calculations, :dehydration, :integer
  end
end
