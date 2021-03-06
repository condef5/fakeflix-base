class Serie < ApplicationRecord
  has_many :rentals, as: :rentable
  has_many :episodes
  enum status: ["coming-soon", "preorder", "billboard"]

  def rented
    rentals.any?
  end

  def duration_episodes
    episodes.sum(:duration)
  end
  
end

# == Schema Information
#
# Table name: series
#
#  id          :bigint(8)        not null, primary key
#  description :text
#  price       :integer
#  rating      :integer
#  status      :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
