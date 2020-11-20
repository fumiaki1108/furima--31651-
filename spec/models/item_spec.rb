require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do

    before do
      @item = FactoryBot.build(:item)
    end

    it '適切な入力がされていればデータが保存できること' do
      expect(@item).to be_valid
    end

    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    
    it '商品名が必須であること' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が必須であること' do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end

    it '商品の状態についての情報が必須てあること' do
      @item.sales_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status Select")
    end

    it '配送料の負担についての情報が必須であること' do
      @item.shipping_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee Select")
    end

    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture Select")
    end

    it '発送までの日数についての情報が必須であること' do
      @item.scheduled_delivery_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery Select")
    end

    it 'カテゴリーの情報が---では保存できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end

    it '商品の状態についての情報が---では保存できないこと' do
      @item.sales_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status Select")
    end

    it '配送料の負担についての情報が---では保存できないこと' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee Select")
    end

    it '発送までの日数についての情報が---では保存できないこと' do
      @item.scheduled_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery Select")
    end

    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of range")
    end

    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = "５０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be Half-width number")
    end

  end
end
