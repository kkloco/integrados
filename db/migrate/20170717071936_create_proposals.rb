class CreateProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals do |t|

    	t.text :numprop
    	t.integer :year
    	t.text :proyecto
    	t.text :departamento
    	t.bigint :rc
    	t.text :tercero
    	t.text :cif
    	t.text :contrato
    	t.text :acuerdos
    	t.text :convenios
    	t.text :otros
    	t.text :finalidad
    	t.text :objeto
    	t.float :importe
    	t.text :empleado_firma
    	t.text :politico_firma

      t.timestamps
    end
      add_index :proposals, :numprop, unique: true, length:255
  end
end
