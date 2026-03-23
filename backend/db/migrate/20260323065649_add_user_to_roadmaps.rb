class AddUserToRoadmaps < ActiveRecord::Migration[8.1]
  def change
    add_reference :roadmaps, :user, null: false, foreign_key: true
  end
end
