class AddFkpropOVoucher < ActiveRecord::Migration[5.0]
  def change
  	add_reference :vouchers, :proposal, index:true
  	add_foreign_key :vouchers, :proposals
  end
end
