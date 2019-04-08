class AddStatusToSeries < ActiveRecord::Migration[5.2]
  def change
    add_column :series, :status, :integer
  end
end
