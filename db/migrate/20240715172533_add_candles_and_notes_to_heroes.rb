class AddCandlesAndNotesToHeroes < ActiveRecord::Migration[7.1]
  def change
    add_column :heroes, :candles, :bigint, default: 1
    add_column :heroes, :notes, :text, array: true, default: ["Rest easy Dear"]
  end
end
