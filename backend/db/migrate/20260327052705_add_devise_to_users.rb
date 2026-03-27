# db/migrate/20260327052705_add_devise_to_users.rb

class AddDeviseToUsers < ActiveRecord::Migration[8.1]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      # 👇 すでにemailカラムはあるので、コメントアウトします
      # t.string :email,              null: false, default: ""
      
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      # ...（以下そのまま）...
    end

    # 👇 もしファイルの下の方に add_index :users, :email があれば、
    # これもすでに存在している可能性が高いのでコメントアウトします
    # add_index :users, :email,                unique: true
    # ...
  end
end