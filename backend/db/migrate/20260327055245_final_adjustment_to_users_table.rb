class FinalAdjustmentToUsersTable < ActiveRecord::Migration[8.1]
  def change
    # 1. 設計書の通り username を NOT NULL にする
    change_column_null :users, :username, false

    # 2. email を NOT NULL & UNIQUE にする
    change_column_null :users, :email, false
    remove_index :users, :email if index_exists?(:users, :email)
    add_index :users, :email, unique: true

    # 3. Deviseが使う encrypted_password を NOT NULL にする（設計書の password_digest の代わり）
    change_column_null :users, :encrypted_password, false

    # 4. 不要になった password_digest カラムを削除（または NULL 許可にする）
    # 今後使わないので削除してしまうのがスッキリします
    remove_column :users, :password_digest, :string if column_exists?(:users, :password_digest)
  end
end