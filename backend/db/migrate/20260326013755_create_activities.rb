class CreateActivities < ActiveRecord::Migration[8.1]
  def change
    create_table :activities do |t|
      # ユーザーは必須
      t.references :user, null: false, foreign_key: true
      # ロードマップは任意（null: true）
      t.references :roadmap, null: true, foreign_key: true
      # 表示テキストは必須
      t.string :description, null: false

      t.timestamps # これで created_at (発生日時) が自動で作られます
    end
  end
end