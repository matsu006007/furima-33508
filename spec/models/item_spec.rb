require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できるとき' do
      it '必要な情報を適切に入力すると、商品の出品ができること' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.product_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @item.product_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it 'カテゴリーの情報のidが１では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'カテゴリーの情報が空では出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it '商品の状態についての情報のidが１では出品できない' do
        @item.product_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Product status must be other than 1')
      end
      it '商品の状態についての情報が空では出品できない' do
        @item.product_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status can't be blank", "Product status is not a number")
      end
      it '配送料の負担についての情報のidが１では出品できない' do
        @item.freight_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Freight must be other than 1')
      end
      it '配送料の負担についての情報が空では出品できない' do
        @item.freight_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Freight can't be blank", "Freight is not a number")
      end
      it '発送元の地域についての情報のidが１では出品できない' do
        @item.ship_region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship region must be other than 1')
      end
      it '発送元の地域についての情報が空では出品できない' do
        @item.ship_region_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship region can't be blank", "Ship region is not a number")
      end
      it '発送までの日数についての情報のidが１では出品できない' do
        @item.ship_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship date must be other than 1')
      end
      it '発送までの日数についての情報が空では出品できない' do
        @item.ship_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date can't be blank", "Ship date is not a number")
      end
      it '価格についての情報が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is invalid', 'Price Out of setting range')
      end
      it '価格が¥300以下では出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '価格が¥9,999,999以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '価格が全角数字では出品できない' do
        @item.price = '５５５５５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '価格が半角英数混合では出品できない' do
        @item.price = '555aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it '価格が半角英語だけでは出品できない' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'ユーザーが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
