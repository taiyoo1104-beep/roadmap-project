# データの重複を防ぐため、一度既存のデータを全削除
Activity.destroy_all
Task.destroy_all
Roadmap.destroy_all
User.destroy_all

# 1. ユーザーの作成
user = User.create!(
  username: "testuser",
  email: "test@test",
  password: "password", # has_secure_password が digest への変換を自動で行います
  avatar_url: "https://example.com/avatar.png"
)

# 2. ロードマップの作成
roadmap = Roadmap.create!(
  user: user,
  title: "testtitle",
  duration: 3,
  target_date: Date.today + 3.months, # 「3」を3ヶ月後の日付として設定
  status: 0
)

# 3. タスクの作成
Task.create!(
  roadmap: roadmap,
  content: "test",
  is_completed: false
)

puts "Seed data created successfully! 🌱"