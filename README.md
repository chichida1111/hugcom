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