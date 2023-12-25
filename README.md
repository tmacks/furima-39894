## usersテーブル

| Column             | Type    | Options                  |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| date_of_birth      | string | null: false               |

### Association
 - has_many :items
 - has_many :orders

## itemsテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| explanation   | text       | null: false                    |
| condition     | string     | null: false                    |
| charge        | string     | null: false                    |
| ship_form     | string     | null: false                    |
| days_required | string     | null: false                    |
| price         | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

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
| post_code       | integer    | null: false                    |
| prefectures     | string     | null: false                    |
| municipality    | string     | null: false                    |
| street_address  | integer    | null: false                    |
| building_name   | string     | null: false                    |
| telephonenumber | integer    | null: false                    |
| order           | references | null: false, foreign_key: true |

### Association
- belongs_to :order