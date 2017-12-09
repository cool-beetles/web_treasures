class TreasureTrashedTypeChange < ActiveRecord::Migration[5.1]
  def change
    change_column(:treasures, :trashed, :boolean)
  end
end
