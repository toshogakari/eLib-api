class CreateUserHasSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :user_has_skills do |t|
      t.references :skill, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
