# アプリケーション名
HugCom

# アプリケーション概要
保育園の先生と保護者が簡単にコミュケーションを取れる、電子版の連絡帳です

# URL
https://hugcom.herokuapp.com/

# テスト用アカウント
- テストユーザー（保護者）
 Eメール:pa1@pa
 パスワード:pa1111
- テストユーザー（先生）
 Eメール:te1@te
 パスワード:te1111
- Basic認証
 user:kosodate_test_user
 password:kosodate55ck

# 利用方法
- 保護者
ユーザー登録・ログイン後に
①同じ組の子供の連絡帳を閲覧できます
②自分の子供の連絡帳の作成できます
③作成した連絡帳からメッセージを送信できます
③作成した連絡帳から依頼された項目をクレジット決済できます
- 先生
ユーザー登録・ログイン後に
①担当している組の子供の全ての連絡帳を閲覧できます
②担当している組の子供の連絡帳からメッセージを送信できます
③担当している組の子供の連絡帳から決済依頼をすることができます

# 目指した課題解決
このアプリケーションを通じて、時間の無い先生や保護者が、簡単にコミュニケーションを取れるようにしました
また、連絡帳内で決済を依頼し、その依頼に対してクレジット決済できることで時間短縮と手間の削減に繋がります

# 洗い出した要件
-ユーザー登録
・ユーザー登録の選択肢を増やすため、先生と保護者の２種類のユーザーを作成できるようにしました
・保護者、先生それぞれが然るべき情報が表示されるようにしました
・登録に不備がある場合は、日本語でエラーメッセージが表示されます
- 決済機能
・PAY.JPを利用した決済機能の実装方法を実装しました
・先生が決済して欲しい項目を用意し、本アプリ内で決済できるようにしました
・決済は連絡帳が作成されていることが前提です
・「決済するボタン」をクリックしたら、DB及びPAY.JPサイトに決済した情報が更新されます
・決済済みの項目は、「決済は完了しています」と表示され、決済されないようになります
- メッセージ投稿機能
・先生、保護者のそれぞれのユーザーがメッセージを投稿できます
・先生、保護者それぞれのメッセージにおいてプルダウンで入力内容が用意されており、送信ボタンを押すだけでもメッセージを遅れるようになっています
・先生ユーザーは写真も投稿できるようになっています

# 実装した機能についてのGIFと説明
- ユーザー登録機能
![63c5bfb4658c701386c7bac3f1fdace1](https://user-images.githubusercontent.com/78330230/112745703-5e75e700-8fe5-11eb-829d-db57dc30dacc.gif)
- 決済機能
![3d183c3a3ea2f2b70bc8e6de82eafd9f](https://user-images.githubusercontent.com/78330230/112745779-ccbaa980-8fe5-11eb-8e83-1e3b0765e17a.gif)
- メッセージ投稿機能
![e8055d1b4a030072a740116b56747baf](https://user-images.githubusercontent.com/78330230/112745830-36d34e80-8fe6-11eb-8693-65b0bc5d3da4.gif)

# 実装予定の機能
- メッセージの非同期通信
- 写真を複数枚投稿

# データベース設計
- ER図
<img width="834" alt="スクリーンショット 2021-03-28 16 44 28" src="https://user-images.githubusercontent.com/78330230/112745643-f7f0c900-8fe4-11eb-8fd1-5546c5ad675c.png">

## parent_users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false               |
| encrypted_password | string  | null: false, unique: true |
| phone_number       | string  | null: false               |
| last_name_p_j      | string  | null: false               |
| first_name_p_j     | string  | null: false               |
| last_name_p_k      | string  | null: false               |
| first_name_p_k     | string  | null: false               |
| group_id           | integer | null: false               |
<!-- _pは保護者、_jは漢字、_kはカタカナを意味する -->

### Association

- has_one  :contact
- has_many :parent_messages
- has_one :card


## teacher_users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false               |
| encrypted_password | string  | null: false, unique: true |
| phone_number       | string  | null: false               |
| last_name_t_j      | string  | null: false               |
| first_name_t_j     | string  | null: false               |
| last_name_t_k      | string  | null: false               |
| first_name_t_k     | string  | null: false               |
| group_id           | integer | null: false               |
<!-- _tは先生、_jは漢字、_kはカタカナを意味する -->

### Association

- has_many :teacher_messages
- has_many :services


## contacts テーブル

| Column         | Type       | Options                                       |
| -------------- | ---------- | --------------------------------------------- |
| group_id       | integer    | null: false                                   |
| last_name_c_j  | string     | null: false                                   |
| first_name_c_j | string     | null: false                                   |
| last_name_c_k  | string     | null: false                                   |
| first_name_c_k | string     | null: false                                   |
| group_id       | integer    | null: false                                   |
| parent_user    | references | null: false, foreign_key: true, type: :bigint |
<!-- _cは子供、_jは漢字、_kはカタカナを意味する -->

### Association

- belongs_to :parent_user
- has_many :parent_messages
- has_many :teacher_messages
- has_one :service


## parent_messages テーブル

| Column              | Type       | Options                                       |
| ------------------- | ---------- | --------------------------------------------- |
| attendance_id       | integer    | null: false                                   |
| body_temperature_id | integer    | null: false                                   |
| pick_up_time_id     | integer    | null: false                                   |
| pick_up_person_id   | integer    | null: false                                   |
| parent_comment      | text       | null: false                                   |
| parent_user         | references | null: false, foreign_key: true, type: :bigint |
| contact             | references | null: false, foreign_key: true, type: :bigint |

### Association

- belongs_to :parent_user
- belongs_to :contact


## teacher_messages テーブル

| Column                | Type       | Options                                       |
| --------------------- | ---------- | --------------------------------------------- |
| physical_condition_id | integer    | null: false                                   |
| school_lunch_id       | integer    | null: false                                   |
| defecation_id         | integer    | null: false                                   |
| teacher_comment       | text       | null: false                                   |
| teacher_user          | references | null: false, foreign_key: true, type: :bigint |
| contact               | references | null: false, foreign_key: true, type: :bigint |

### Association

- belongs_to :teacher_user
- belongs_to :contact


## services テーブル

| Column          | Type       | Options                                       |
| ----------------| ---------- | --------------------------------------------- |
| service_type_id | integer    | null: false                                   |
| unit_price_id   | integer    | null: false                                   |
| number_of_times | integer    | null: false                                   |
| teacher_comment | text       | null: false                                   |
| teacher_user    | references | null: false, foreign_key: true, type: :bigint |
| contact         | references | null: false, foreign_key: true, type: :bigint |

### Association

- belongs_to :teacher_user
- belongs_to :contact
- has_one :service_order


## service_orders テーブル

| Column  | Type       | Options                                       |
| --------| ---------- | --------------------------------------------- |
| service | references | null: false, foreign_key: true, type: :bigint |

### Association

- belongs_to :service


## cards テーブル

| Column         | Type       | Options                                       |
| ---------------| ---------- | --------------------------------------------- |
| card_token     | string     | null: false                                   |
| customer_token | string     | null: false                                   |
| parent_user    | references | null: false, foreign_key: true, type: :bigint |


### Association

- belongs_to :parent_user

# ローカルでの動作方法
% git clone https://github.com/chichida1111/hugcom
% cd hugcom
% bundle install
% yarn install
% rails db:create
% rails db:migrate
% rails s
- パッケージ
node,yarn
- Rubyのバージョン
ruby 2.6.5
rails 6.0.0

# 開発環境
- バックエンド
Ruby,Ruby on Rails
- フロントエンド
html,scss,JavaScript
- データベース
MySQL,SequelPro
- インフラ
AWS
- Webサーバ（本番環境）
Nginx
- アプリケーションサーバ（本番環境）
Unicorn
- ソース管理
GitHub,GitHubDesktop
- テスト
RSpec
- エディタ
VSCode