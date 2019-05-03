class User < ApplicationRecord
  has_secure_password

  def admin?
    role == "admin"
    true
  end
 
  def regular?
    role == "regular"
  end
end

# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  role            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
