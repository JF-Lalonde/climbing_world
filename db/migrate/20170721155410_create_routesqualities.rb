class CreateRoutesqualities < ActiveRecord::Migration[5.1]
  def change
    create_table :routesqualities do |t|
      t.references :routes, foreign_key: true
      t.references :qualities, foreign_key: true
      t.float :average_quality

      t.timestamps
    end
  end
end
