class User < ApplicationRecord
  has_many :roadmaps, dependent: :destroy
end
