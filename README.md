# テーブル設計

## users テーブル

| CoLumn          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birthday        | integer | null: false |

### Association

- has_many :items
- has_many :comments
- has_one  :payments

## items テーブル

| CoLumn              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| product_name        | string     | null: false       |
| product_description | text       | null: false       |
| price               | integer    | null: false       |
| category            | string     | null: false       |
| product_status      | string     | null: false       |
| freight             | string     | null: false       |
| ship_region         | string     | null: false       |
| ship_date           | string     | null: false       |
| user                | references | foreign_key: true |
| payment             | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :payment
- has_many :comments

## comments テーブル

| CoLumn  | Type       | Options           |
| ------- | ---------- | ----------------- |
| text    | text       | null: false       |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## payments テーブル
| CoLumn              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| card_namber         | integer    | null: false       |
| exp_month           | integer    | null: false       |
| exp_year            | integer    | null: false       |
| security_code       | integer    | null: false       |
| post_code           | integer    | null: false       |
| prefecture          | string     | null: false       |
| city                | string     | null: false       |
| block               | string     | null: false       |
| building            | string     | null: false       |
| phone               | integer    | null: false       |
| user                | references | foreign_key: true |

 ### Association

 - belongs_to :user
 - has_many :items
