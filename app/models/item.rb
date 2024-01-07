class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :charge
  belongs_to :condition
  belongs_to :days_required
  belongs_to :prefecture
  has_one_attached :image

  validates :name, :string, presence: true
  validates 
  validates
  validates
  validates
  validates
  validates
  validates
  validates

end
