class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :street_address, :building_name, :telephonenumber,
                :user_id, :item_id, :order_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipality
    validates :street_address
    validates :telephonenumber,
              format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid.10 digits or more and 11 digits or less' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :token
  end

  def save
    order = Order.create(item_id:, user_id:)
    Address.create(post_code:, prefecture_id:, municipality:, street_address:,
                   building_name:, telephonenumber:, order_id: order.id)
  end
end
