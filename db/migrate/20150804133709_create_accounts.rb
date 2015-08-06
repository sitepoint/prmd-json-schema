class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :email
      t.string :encrypted_password

      t.timestamps null: false
    end
  end
end
