class CreateQualities < ActiveRecord::Migration[5.1]
  def change
    create_table :qualities do |t|
      t.integer :star_value

      t.timestamps
    end
  end
end
