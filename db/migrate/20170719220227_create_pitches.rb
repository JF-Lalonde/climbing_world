class CreatePitches < ActiveRecord::Migration[5.1]
  def change
    create_table :pitches do |t|
      t.integer :number

      t.timestamps
    end
  end
end
