class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ''
      t.string :email, null: false, default: ''
      t.string :password_digest, null: false, default: ''
      t.integer :experience, limit: 1, null: false, default: 0
      t.text :profile
      t.references :job, index: true, foreign_key: true

      t.timestamps
    end
  end
end
