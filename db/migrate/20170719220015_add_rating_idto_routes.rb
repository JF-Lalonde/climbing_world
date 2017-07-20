class AddRatingIdtoRoutes < ActiveRecord::Migration[5.1]
  def change
    add_reference :routes, :rating, foreign_key: true
  end
end
