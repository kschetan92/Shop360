class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :email
      t.string :payment_mode

      t.timestamps null: false
    end
  end
end
