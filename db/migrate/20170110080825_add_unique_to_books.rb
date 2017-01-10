class AddUniqueToBooks < ActiveRecord::Migration[5.0]
  def change
    add_index :books, :isbn, unique: true
  end
end
