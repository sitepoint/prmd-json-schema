class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts, id: false do |t|
      t.uuid :id, primary_key: true
      t.string :email
      t.string :encrypted_password
      t.string :password_salt,      null: false
      t.string :jti
      t.string :reset_password_token
      t.string :refresh_token, unique: true
      t.datetime :reset_password_sent_at

      t.timestamps null: false
    end
  end
end
