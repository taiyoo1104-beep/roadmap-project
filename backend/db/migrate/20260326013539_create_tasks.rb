class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      # roadmap_id を必須にし、外部キーとして設定
      t.references :roadmap, null: false, foreign_key: true
      # タスク内容を必須に
      t.string :content, null: false
      # 初期値は「未完了(false)」で、空欄禁止
      t.boolean :is_completed, null: false, default: false
      # 期限は任意なのでそのまま
      t.date :due_date

      t.timestamps
    end
  end
end