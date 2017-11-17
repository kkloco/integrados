class AddFkUserVoucher < ActiveRecord::Migration[5.0]
  def change

  	add_reference :vouchers, :user, index:true
  	add_foreign_key :vouchers, :users

  end
end
