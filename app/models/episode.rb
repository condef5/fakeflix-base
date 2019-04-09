class Episode < ApplicationRecord
  belongs_to :serie
end

# == Schema Information
#
# Table name: episodes
#
#  id          :bigint(8)        not null, primary key
#  description :text
#  duration    :integer
#  playback    :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  serie_id    :bigint(8)        indexed
#
# Indexes
#
#  index_episodes_on_serie_id  (serie_id)
#
# Foreign Keys
#
#  fk_rails_...  (serie_id => series.id)
#
