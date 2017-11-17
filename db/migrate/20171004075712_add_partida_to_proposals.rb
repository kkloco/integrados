class AddPartidaToProposals < ActiveRecord::Migration[5.0]
  def change
  	add_column :proposals, :partida, :string
  end
end
