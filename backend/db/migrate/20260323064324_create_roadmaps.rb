class CreateRoadmaps < ActiveRecord::Migration[8.1]
  def change
    create_table :roadmaps do |t|
      t.string :title
      t.date :target_date
      t.integer :progress_percentage
      t.timestamps
    end
  end
end
