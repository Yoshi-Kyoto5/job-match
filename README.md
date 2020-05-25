# README

# Name
![job-matching](https://user-images.githubusercontent.com/61217608/81028922-3279e080-8ebe-11ea-9b1d-ffc621a92302.png)

# Requirement
- Ruby | Rails | MySQL | AWS(Route53, ACM, CloudFront, EC2, S3) |
  Nginx | Unicorn | Capistrano | GitHub |
  carrierwave | mini_magick | jTinder | jquery-rails | action_cable |
  font-awesome-sass | bootstrap | devise | Rspec-rails | Factory_bot_rails |

# Features
- ユーザーの一覧表示機能
- スワイプ機能
- like, dislike機能
- マッチングしたユーザーの保存機能
- マッチング相手同士の一覧表示機能
- マッチング相手とのチャット機能
- 画像ファイルのアップロード機能
- 管理ユーザー登録、編集機能
- 管理ユーザーログイン、ログアウト機能

# Suteru
![readme2](https://user-images.githubusercontent.com/61217608/81054352-9f629a00-8f01-11ea-93c6-fee820aa7878.jpg)

# Overview 
- 仕事探しのマッチングアプリ（新型コロナ緊急対策）
- URL: https://www.job-match-support-corona.com/

# Test account
- （求職者）E-mail = user3@gmail.com, Password = 888888
- （求人者）E-mail = user1@gmail.com, Password = 888888

# Description
- 登録したユーザーを確認できる（求人者 / 求職者）
- 興味のあるユーザーに「いいね」が押せる
- マッチングしたユーザー同士でチャットができる（採用状況の説明/希望案件への質問）

# Planning background
- 新型コロナの影響で、仕事探しに困っている人が増えている（求職者）
- 新型コロナの影響で、逆に仕事が増えて人手不足に困っている企業がある
  例えば、オンラインサービス、生活必需品の小売業、製造メーカー（マスク/在宅勤務商品/衛生商品）
- 上記の求人者と求職者が迅速にマッチングして経済が回る支援がしたいと思ったこと。

# Author 
- Github: https://github.com/Yoshi-Kyoto5/

# Database creation
## users-table 
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|encrypted_password|string|null: false|
|status|integer|null: false|
|img_name|string|
|introduction|text|
|job_name|string|
|work_location|string|
|work_time|string|
|start_date|string|
|salary|string|
|corona_support|text|
### Association
- has_many :messages
- has_many :chat_room_users

## reactions-table 
|Column|Type|Options|
|------|----|-------|
|to_user_id|integer|null: false|
|from_user_id|integer|null: false|
|status|integer|null: false|
### Association
- belongs_to :to_user, class_name: "User"
- belongs_to :from_user, class_name: "User"

## chat_rooms-table 
|Column|Type|Options|
|------|----|-------|
### Association
- has_many :chat_messages
- has_many :chat_room_users

## chat_room_users-table 
|Column|Type|Options|
|------|----|-------|
|chat_room_id|integer|null: false|
|user_id|integer|null: false|
### Association
- belongs_to :chat_room
- belongs_to :user

## chat_messages-table 
|Column|Type|Options|
|------|----|-------|
|chat_room_id|integer|null: false|
|user_id|integer|null: false|
|message|string|null: false|
### Association
- belongs_to :chat_room
- belongs_to :user