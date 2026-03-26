class User < ApplicationRecord
  has_secure_password
  has_many :roadmaps, dependent: :destroy # これを追加
end