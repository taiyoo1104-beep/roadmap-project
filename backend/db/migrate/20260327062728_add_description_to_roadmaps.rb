class AddDescriptionToRoadmaps < ActiveRecord::Migration[8.1]
  def change
    add_column :roadmaps, :description, :text
  end
end
