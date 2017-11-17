class CreateVouchers < ActiveRecord::Migration[5.0]
  def change
    create_table :vouchers do |t|

    	t.text :numvale
    	t.text :numprop
    	t.integer :year
    	
    	t.text :departamento
    	t.bigint :rc
    	t.text :tercero
    	
    	t.text :finalidad
    	t.text :objeto
    	t.float :importe
    	
      t.timestamps
    end
    add_index :vouchers, :numvale, unique: true, length:255
  end
end
