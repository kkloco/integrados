class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
      t.string :nombre 
      t.timestamps
    end
    add_index :positions, :nombre, unique: true
  end
end
