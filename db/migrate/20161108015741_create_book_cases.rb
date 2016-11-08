class CreateBookCases < ActiveRecord::Migration[5.0]
  def change
    create_table :book_cases do |t|
      t.integer :evaluation
      t.integer :level

      t.timestamps
    end
  end
end
