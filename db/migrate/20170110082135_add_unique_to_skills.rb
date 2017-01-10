class AddUniqueToSkills < ActiveRecord::Migration[5.0]
  def change
    add_index :skills, :name, unique: true
  end
end
