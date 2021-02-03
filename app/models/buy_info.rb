class BuyInfo
  include ActiveModel::Model
  attr_accessor :post_code, :ship_region_id, :city, :block, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9\d]{3}-[0-9\d]{4}\z/ }
    validates :city
    validates :block
    validates :phone, format: { with: /\A[0-9]+\z/ }, length: { maximum: 11 }
    validates :ship_region_id, numericality: { other_than: 1 }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Payment.create(post_code: post_code, ship_region_id: ship_region_id, city: city, block: block, building: building,
                   phone: phone, buyer_id: buyer.id)
  end
end
