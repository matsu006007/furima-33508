class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :freight
  belongs_to :ship_region
  belongs_to :ship_date
  belongs_to :user
  has_one_attached :image

   with_options presence: true do
    validates :product_name
    validates :product_description
    validates :image
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
    with_options numericality: {other_than: 1 } do
      validates :category_id
      validates :product_status_id
      validates :freight_id
      validates :ship_region_id
      validates :ship_date_id
    end
  end
end
