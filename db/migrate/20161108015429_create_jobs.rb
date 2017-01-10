class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :name, limit: 255, null: false, default: ''

      t.timestamps
    end
  end
end
