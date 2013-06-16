class AddColumnsToCalculations < ActiveRecord::Migration
  def change
    add_column :calculations, :hourly_maintenance, :float
    add_column :calculations, :daily_maintenance, :float
  end
end
