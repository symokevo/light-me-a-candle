class CreateCandles < ActiveRecord::Migration[7.1]
  def change
    create_table :candles do |t|
      t.references :hero, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
