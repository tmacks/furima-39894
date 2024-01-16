class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :sretreet_addss, :building_name, :telephonenumber, :user_id

  with_options presence: true do
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :sretreet_addss
    validates :telephonenumber,format: {with: /\A[0-9]{10,11}\z/}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, sretreet_addss: sretreet_addss, building_name: building_name, telephonenumber: telephonenumber, order_id: order_id)
  end
end
