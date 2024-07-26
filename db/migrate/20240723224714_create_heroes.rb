class CreateHeroes < ActiveRecord::Migration[7.1]
  def change
    create_table :heroes do |t|
      t.string :name, null: false
      t.string :image
      t.bigint :candles, default: 0
      t.text :notes, array: true, default: []
      t.bigint :created_by_id, null: false

      t.timestamps
    end

    add_foreign_key :heroes, :users, column: :created_by_id
  end
end
