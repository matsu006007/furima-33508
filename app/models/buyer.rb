class Buyer < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :payment

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ship_region
end
