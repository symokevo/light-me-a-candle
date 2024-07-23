class ChangeUserIdToAllowNullInCandles < ActiveRecord::Migration[7.1]
  def change
    change_column_null :candles, :user_id, true
  end
end
