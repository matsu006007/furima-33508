# テーブル設計

## users テーブル

| CoLumn          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| encrypted_password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birthday        | date | null: false |

### Association

- has_many :items
- has_many :comments
- has_many  :buyers

## items テーブル

| CoLumn              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| product_name        | string     | null: false       |
| product_description | text       | null: false       |
| price               | integer    | null: false       |
| category_id            | integer     | null: false       |
| product_status_id      | integer     | null: false       |
| freight_id             | integer     | null: false       |
| ship_region_id         | integer     | null: false       |
| ship_date_id           | integer     | null: false       |
| user                | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :buyer

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
| post_code           | string    | null: false       |
| prefecture_id          | integer     | null: false       |
| city                | string     | null: false       |
| block               | string     | null: false       |
| building            | string     |        |
| phone               | string    | null: false       |
| buyer                | references | foreign_key: true |

 ### Association

 - belongs_to :buyer


 ## buyers テーブル

| CoLumn              | Type        | Options          |
| ------------------- | ----------- | ---------------- |
| user                | references | foreign_key: true |
| item                | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :payment


