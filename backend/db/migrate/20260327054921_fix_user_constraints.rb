class FixUserConstraints < ActiveRecord::Migration[8.1]
  def change
    # 1. username を NOT NULL にする
    change_column_null :users, :username, false

    # 2. email を NOT NULL にし、UNIQUE（重複不可）にする
    change_column_null :users, :email, false
    # すでにインデックスがある場合は一旦削除してから貼り直すか、add_index を追記
    remove_index :users, :email if index_exists?(:users, :email)
    add_index :users, :email, unique: true

    # 3. password_digest を NOT NULL にする
    change_column_null :users, :password_digest, false
  end
end