class ChangeRatingToStringInMovies < ActiveRecord::Migration[5.2]
  def change
    change_column :movies, :rating, :string
  end
end
