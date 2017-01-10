class CreateBookCases < ActiveRecord::Migration[5.0]
  def change
    create_table :book_cases do |t|
      t.integer :evaluation, limit: 1, null: false, default: 0
      t.integer :level, null: false, default: 0
      t.references :user, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true

      t.timestamps
    end
  end
end
