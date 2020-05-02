# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "create Users"
User.create!(
  email: 'work1@gmail.com',
  password: '888888',
  name: '漫画コミュニティ株式会社',
  introduction: '無料漫画コミュニティサービス運営',
  sex: 0,
  img_name: open("#{Rails.root}/db/dummy_img/1.jpg"),
  job_name: 'Webエンジニア',
  work_location: '京都',
  work_time: '9:00 ~ 18:00',
  salary: '200,000/月',
  corona_support: 'リモートワーク実施済'
)
User.create!(
  email: 'user2@example.com',
  password: 'aaaaaaaa',
  name: '田中 元気',
  introduction: 'キャビンアテンダント',
  sex: 0,
  img_name: open("#{Rails.root}/db/dummy_img/6.jpg")
  job_name: '',
  work_location: '沖縄',
  work_time: '',
  salary: '',
  corona_support: ''
)
User.create!(
  email: 'user3@example.com',
  password: 'aaaaaaaa',
  name: '青空 花',
  introduction: 'カメラマン',
  sex: 1,
  img_name: open("#{Rails.root}/db/dummy_img/3.jpg")
  job_name: '',
  work_location: '千葉',
  work_time: '',
  salary: '',
  corona_support: ''
)
User.create!(
  email: 'user4@example.com',
  password: 'aaaaaaaa',
  name: 'Lily',
  introduction: 'ヨガインストラクター',
  sex: 1,
  img_name: open("#{Rails.root}/db/dummy_img/4.jpg")
  job_name: '',
  work_location: '石川',
  work_time: '',
  salary: '',
  corona_support: ''
)
User.create(
  email: 'user5@example.com',
  password: 'aaaaaaaa',
  name: 'Mike',
  introduction: 'スペイン語教師',
  sex: 0,
  img_name: open("#{Rails.root}/db/dummy_img/5.jpg")
  job_name: '',
  work_location: '群馬',
  work_time: '',
  salary: '',
  corona_support: ''  
)