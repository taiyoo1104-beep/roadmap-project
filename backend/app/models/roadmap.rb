class Roadmap < ApplicationRecord
  belongs_to :user  # これを追加
  has_many :tasks, dependent: :destroy # 今後のためにタスクとの関係も追加
end