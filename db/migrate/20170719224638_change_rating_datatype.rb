class ChangeRatingDatatype < ActiveRecord::Migration[5.1]
  def change
    change_column :ratings, :number, :string
  end
end
