class AddCreatedByIdToCandles < ActiveRecord::Migration[7.1]
  def change
    add_column :candles, :created_by_id, :integer
  end
end
