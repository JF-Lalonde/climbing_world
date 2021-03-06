class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :role, default: 0
      t.string :password_digest

      t.timestamps
    end
  end
end
