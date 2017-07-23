class AddStarCountToQuality < ActiveRecord::Migration[5.1]
  def change
    add_column :routesqualities, :star_count, :integer
  end
end
