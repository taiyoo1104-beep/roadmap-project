class CreateRoadmaps < ActiveRecord::Migration[8.1]
  def change
    create_table :roadmaps do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.integer :duration, null: false      # duration を追加
      t.date :target_date, null: false
      t.integer :status, null: false, default: 0 # status を追加、初期値は 0

      t.timestamps
    end
  end
end