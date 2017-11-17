class CreateCouncils < ActiveRecord::Migration[5.0]
  def change
    create_table :councils do |t|
      t.text :nombre
      t.text :responsable
      t.integer :id_responsable

      t.timestamps
    end
    add_index :councils, :ID, unique: true
  end
end
