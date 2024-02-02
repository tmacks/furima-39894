class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
  belongs_to :category
  belongs_to :charge
  belongs_to :condition
  belongs_to :days_required
  belongs_to :prefecture
  has_one_attached :image

  validates :name, :explanation, :condition_id, :charge_id, :prefecture_id, :days_required_id, :category_id, :price, :user,
            :image, presence: true
  validates :condition_id, :charge_id, :prefecture_id, :days_required_id, :category_id,
            numericality: { other_than: 1, message: "can't be blank" }

  validates :price, allow_blank: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
