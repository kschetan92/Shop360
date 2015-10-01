class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :mobile, limit: 5
      t.text :address
      t.integer :pincode
      t.date :date_of_birth
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
