## usersテーブル

| Column             | Type    | Options                  |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| date_of_birth      | date   | null: false               |

### Association
 - has_many :items
 - has_many :orders

## itemsテーブル
| Column           | Type       | Options                        |
| -------------    | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| explanation      | text       | null: false                    |
| condition_id     | integer    | null: false                    |
| charge_id        | integer    | null: false                    |
| prefectures_id   | integer    | null: false                    |
| days_required_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル
| Column | Type       | Options                        |
| ----   | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :address

## addressテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefectures_id  | integer    | null: false                    |
| municipality    | string     | null: false                    |
| street_address  | string     | null: false                    |
| building_name   | string     |                                |
| telephonenumber | string     | null: false                    |
| order           | references | null: false, foreign_key: true |

### Association
- belongs_to :order