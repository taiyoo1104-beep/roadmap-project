class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      t.references :roadmap, null: false, foreign_key: true
      t.string :content
      t.boolean :is_completed

      t.timestamps
    end
  end
end
