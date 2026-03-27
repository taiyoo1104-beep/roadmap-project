class User < ApplicationRecord
  # 👈 もしこれがあったら、削除（またはコメントアウト）してください！
  # has_secure_password 

  # JWTの失効管理
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Deviseの設定
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # ロードマップとの紐付け（以前作ったものがあれば残す）
  has_many :roadmaps, dependent: :destroy
end