class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :name
    validates :info
  end

  validates :prefecture_id, presence: { message: 'Select' }

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_id
    validates :scheduled_delivery_id
  end

  validates :price, presence: true
  validates_numericality_of :price, with: /\A[0-9]+\z/, message: 'must be Half-width number'
  validates_inclusion_of :price, in: 300..9999999, message: 'is out of range'

  belongs_to :user
  has_one :order
  
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :prefecture
  belongs_to :shipping_fee
  belongs_to :scheduled_delivery
end