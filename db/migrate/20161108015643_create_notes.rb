class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.text :note, null: false, default: ''
      t.references :book_case, index: true, foreign_key: true

      t.timestamps
    end
  end
end
