class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.string :name, limit: 45, null: false, default: ''

      t.timestamps
    end
  end
end
