class CreateUsersRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :users_routes do |t|
      t.references :route, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
