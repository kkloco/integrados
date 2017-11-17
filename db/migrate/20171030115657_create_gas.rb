class CreateGas < ActiveRecord::Migration[5.0]
  def change
    create_table :gas, :id => false do |t|
      t.string :numcomb
      t.string :matricula
      t.string :proveedor
      t.string :concepto
      t.float :importe	
      t.timestamps
    end
    add_index :gas, :numcomb
  end
end
