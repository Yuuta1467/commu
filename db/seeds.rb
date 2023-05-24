# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@commu',
  password: 'testtest'
)

users = User.create!(
  [
    {email: 'a@a', name: 'ゆーた', password: 'password', introduction: 'よろしく', helper_type: '未設定', is_deleted: 'false'},
    {email: 'a@a1', name: 'ゆーた１', password: 'password', introduction: 'よろしく',  helper_type: '介護職', is_deleted: 'false'},
    {email: 'a@a2', name: 'ゆーた２', password: 'password', introduction: 'よろしく', helper_type: '未設定', is_deleted: 'false'},
    {email: 'a@a3', name: 'ゆーた３', password: 'password', introduction: 'よろしく', helper_type: '在宅介護', is_deleted: 'false'},
    {email: 'a@a4', name: 'ゆーた４', password: 'password', introduction: 'よろしく', helper_type: 'その他', is_deleted: 'false'},
    {email: 'a@a5', name: 'ゆーた５', password: 'password', introduction: 'よろしく', helper_type: '介護職', is_deleted: 'false'},
    {email: 'a@a6', name: 'ゆーた６', password: 'password', introduction: 'よろしく', helper_type: 'その他', is_deleted: 'false'},
    {email: 'a@a7', name: 'ゆーた７', password: 'password', introduction: 'よろしく', helper_type: '在宅介護', is_deleted: 'true'}
  ]
)

tags = Tag.create!(
  [
    {name: '悩み'},
    {name: '相談'},
    {name: '疑問'},
    {name: '雑談'},
    {name: 'その他'}
  ]
  )

Post.create!(
  [
    {user_id: users[0].id, content: '悩みがあります', tag_id: tags[0].id },
    {user_id: users[1].id, content: '相談があります', tag_id: tags[1].id },
    {user_id: users[2].id, content: '疑問があります', tag_id: tags[2].id },
    {user_id: users[3].id, content: '雑談しましょう', tag_id: tags[3].id },
    {user_id: users[4].id, content: 'こんにちは', tag_id: tags[4].id },
    {user_id: users[5].id, content: '悩んでいます', tag_id: tags[0].id },
    {user_id: users[6].id, content: '介護について相談があります', tag_id: tags[1].id },
    {user_id: users[0].id, content: '色々なお話をしましょう！', tag_id: tags[3].id },
    {user_id: users[1].id, content: '介護について疑問があります', tag_id: tags[2].id },
    {user_id: users[2].id, content: 'よろしくお願いします', tag_id: tags[4].id },
    {user_id: users[3].id, content: '最近疲れています', tag_id: tags[4].id },
    {user_id: users[4].id, content: '介護は大変ですか？', tag_id: tags[2].id }
  ]
  )

