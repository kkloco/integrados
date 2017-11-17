class CreateEcyears < ActiveRecord::Migration[5.0]
  def change
    create_table :ecyears do |t|

    	t.integer :ejercicio
    	t.integer :orden
    	t.integer :activo

      t.timestamps
    end
    add_index :ecyears, :ejercicio, unique: true
  end
end
