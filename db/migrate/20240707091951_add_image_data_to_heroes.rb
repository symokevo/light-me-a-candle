class AddImageDataToHeroes < ActiveRecord::Migration[7.1]
  def change
    add_column :heroes, :image_data, :text
  end
end
