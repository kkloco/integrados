class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars, :id => false do |t|

      t.string :matricula
      t.string :localizacion
      t.string :conductor
      t.string :finalidad

      t.timestamps
    end
    add_index :cars, :matricula
  end
end
