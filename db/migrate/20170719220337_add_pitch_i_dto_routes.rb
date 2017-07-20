class AddPitchIDtoRoutes < ActiveRecord::Migration[5.1]
  def change
    add_reference :routes, :pitch, foreign_key: true
  end
end
