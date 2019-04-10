class Rental < ApplicationRecord
  belongs_to :rentable, polymorphic: true

  def self.rentables(type)
    Rental.includes(:rentable).where(rentable_type: type).map { |rental|  rental.rentable}
  end
end

# == Schema Information
#
# Table name: rentals
#
#  id            :bigint(8)        not null, primary key
#  paid_price    :integer
#  rentable_type :string           indexed => [rentable_id]
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  rentable_id   :bigint(8)        indexed => [rentable_type]
#
# Indexes
#
#  index_rentals_on_rentable_type_and_rentable_id  (rentable_type,rentable_id)
#
