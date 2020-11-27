class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number,
                :building, :telephone, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "must select" }
    validates :city
    validates :house_number
    validates :telephone, format: {with: /\A\d{10,11}\z/, message: "number Input only number"}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id,
                   city: city, house_number: house_number, building: building,
                    telephone: telephone, order_id: order.id)
  end
end