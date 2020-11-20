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

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},
                    format: { with: /\A[0-9]+\z/, message: 'Half-width number' }

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :sales_status, :prefecture, :shipping_fee, :scheduled_delivery

end
