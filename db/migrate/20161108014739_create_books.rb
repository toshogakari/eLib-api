class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.text :description
      t.string :isbn
      t.string :mb_image_url
      t.string :pc_image_url
      t.string :title

      t.timestamps
    end
  end
end
