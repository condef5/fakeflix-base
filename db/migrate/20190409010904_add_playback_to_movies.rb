class AddPlaybackToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :playback, :integer
  end
end
