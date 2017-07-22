class CreateRoutesqualities < ActiveRecord::Migration[5.1]
  def change
    create_table :routesqualities do |t|
      t.references :route, foreign_key: true
      t.references :quality, foreign_key: true
      t.float :average_quality

      t.timestamps
    end
  end
end
