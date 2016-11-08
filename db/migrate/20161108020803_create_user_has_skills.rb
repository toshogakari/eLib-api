class CreateUserHasSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :user_has_skills do |t|
      t.references :skill, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
