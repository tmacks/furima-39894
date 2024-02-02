require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空では保存できないこと' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeは「3桁ハイフン4桁でないと保存できないこと' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが空では保存できないこと' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空では保存できないこと' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'street_addressが空では保存できないこと' do
        @order_address.street_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'telephonenumberが空では保存できないこと' do
        @order_address.telephonenumber = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephonenumber can't be blank")
      end
      it 'telephonenumberは9桁以下では登録できないこと' do
        @order_address.telephonenumber = '12345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephonenumber is invalid.10 digits or more and 11 digits or less')
      end
      it 'telephonenumberは12桁以上では登録できないこと' do
        @order_address.telephonenumber = '12345678910123'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephonenumber is invalid.10 digits or more and 11 digits or less')
      end
      it 'telephonenumberは半角数字以外が含まれている場合、登録できないことこと' do
        @order_address.telephonenumber = 'abc'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephonenumber is invalid.10 digits or more and 11 digits or less')
      end
      it 'user_idが空だと登録できないこと' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと登録できないこと' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
