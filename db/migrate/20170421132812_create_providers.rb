class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.string  :CIF
      t.string  :razon_social
      t.string  :contacto
      t.string  :direccion
      t.string  :poblacion
      t.integer :cod_postal
      t.string :provincia
      t.integer :tlf2 
      t.integer :tlf1
      t.integer :fax
      t.string  :web
      t.string  :email
      t.float	:tope_gasto
      t.timestamps
    end
    add_index :providers, :CIF, unique: true
  end
end
