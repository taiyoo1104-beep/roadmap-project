class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :username, null: false         # 追記
      t.string :email, null: false            # 追記
      t.string :password_digest, null: false  # 追記
      t.string :avatar_url

      t.timestamps
    end
    # これも重要：emailの重複を禁止する
    add_index :users, :email, unique: true
  end
end