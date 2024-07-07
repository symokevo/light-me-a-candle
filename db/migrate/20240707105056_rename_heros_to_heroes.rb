class RenameHerosToHeroes < ActiveRecord::Migration[7.1]
  def change
    rename_table :heros, :heroes
  end
end
