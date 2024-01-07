class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :charge
  belongs_to :condition
  belongs_to :days_required
  belongs_to :prefecture
  has_one_attached :image

  validates :name, :explanation, :condition_id, :charge_id, :prefecture_id, :days_required_id, :category_id, :price, :user, presence: true
  validates :condition_id, :charge_id, :prefecture_id, :days_required_id, :category_id, numericality: { other_than: 1 } 
 

end
