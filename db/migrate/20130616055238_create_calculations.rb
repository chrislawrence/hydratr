class CreateCalculations < ActiveRecord::Migration
  def change
    create_table :calculations do |t|
      t.float :deficit
      t.float :maintenance
      t.string :method

      t.timestamps
    end
  end
end
