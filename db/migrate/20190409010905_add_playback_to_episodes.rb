class AddPlaybackToEpisodes < ActiveRecord::Migration[5.2]
  def change
    add_column :episodes, :playback, :integer
  end
end
