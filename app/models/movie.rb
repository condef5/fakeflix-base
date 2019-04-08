class Movie < ApplicationRecord
  has_many :rentals, as: :rentable
end

# == Schema Information
#
# Table name: movies
#
#  id          :bigint(8)        not null, primary key
#  description :text
#  duration    :integer
#  price       :integer
#  rating      :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
