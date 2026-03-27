class AddFieldsToRoadmaps < ActiveRecord::Migration[8.1]
  def change
    add_column :roadmaps, :category, :string
    add_column :roadmaps, :target_level, :string
  end
end
