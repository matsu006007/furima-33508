require 'rails_helper'

RSpec.describe BuyInfo, type: :model do
  before do
    @buy_info = FactoryBot.build(:buy_info)
  end
  describe "商品の購入" do
    context '商品が購入できるとき' do
      it '必要な情報を適切に入力すると、商品が購入できる' do
        expect(@buy_info).to be_valid

      end
      it '建物名が空でも商品を購入できる'do
        @buy_info.building = nil
        expect(@buy_info).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it '郵便番号が空では商品を購入できない' do
        @buy_info.post_code = nil
        @buy_info.valid?
        expect(@buy_info.errors.full_messages).to include("Post code can't be blank")
      end
      it '都道府県が空では商品を購入できない' do
        @buy_info.ship_region_id = nil
        @buy_info.valid?
        expect(@buy_info.errors.full_messages).to include("Ship region can't be blank")
      end
      it '都道府県のidが1では商品を購入できない' do
        @buy_info.ship_region_id = 1
        @buy_info.valid?
        expect(@buy_info.errors.full_messages).to include("Ship region must be other than 1")
      end
      it '市区町村が空では商品を購入できない' do
        @buy_info.city = nil
        @buy_info.valid?
        expect(@buy_info.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では商品を購入できない' do
        @buy_info.block = nil
        @buy_info.valid?
        expect(@buy_info.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が空では商品を購入できない' do
        @buy_info.phone = nil
        @buy_info.valid?
        expect(@buy_info.errors.full_messages).to include("Phone can't be blank")
      end
      it '郵便番号にハイフンが含まれていなければ商品を購入できない' do
        @buy_info.post_code = '1231234'
        @buy_info.valid?
        expect(@buy_info.errors.full_messages).to include("Post code is invalid")
      end
      it '電話番号が11桁以上では商品を購入できない' do
        @buy_info.phone = '090123456789'
        @buy_info.valid?
        expect(@buy_info.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end
      it '電話番号が全角数字では商品を購入できない' do
        @buy_info.phone = '０９０１２３４５６７８'
        @buy_info.valid?
        expect(@buy_info.errors.full_messages).to include("Phone is invalid")
      end
      it 'user_idが空では商品を購入できない' do
        @buy_info.user_id = nil
        @buy_info.valid?
        expect(@buy_info.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では商品を購入できない' do
        @buy_info.item_id = nil
        @buy_info.valid?
        expect(@buy_info.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
