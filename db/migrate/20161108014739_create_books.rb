class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.text :description
      t.string :isbn, limit: 13, null: false, default: 0
      t.string :mb_image_url, limit: 512
      t.string :pc_image_url, limit: 512
      t.string :title, limit: 255, null: false, default: ''

      t.timestamps
    end
  end
end
