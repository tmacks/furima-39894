require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(email: '')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      user = User.new(password: '')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'last_nameが空では登録できない' do
      user = User.new(last_name: '')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      user = User.new(first_name: '')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_kanaが空では登録できない' do
      user = User.new(last_name_kana: '')
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      user = User.new(first_name_kana: '')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'date_of_birthが空では登録できない' do
      user = User.new(date_of_birth: '')
      user.valid?
      expect(user.errors.full_messages).to include("Date of birth can't be blank")
    end
    it 'last_nameが全角以外では登録できない' do
      user = User.new(last_name: 'abc')
      user.valid?
      expect(user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
    end
    it 'first_nameが全角以外では登録できない' do
      user = User.new(first_name: 'abc')
      user.valid?
      expect(user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
    end
    it 'last_name_kanaが全角カタカナ以外では登録できない' do
      user = User.new(last_name_kana: 'abc')
      user.valid?
      expect(user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters.')
    end
    it 'first_name_kanaが全角カタカナ以外では登録できない' do
      user = User.new(first_name_kana: 'abc')
      user.valid?
      expect(user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters.')
    end
    it 'passwordが文字と数字の混合でないと登録できない' do
      user = User.new(password: 'abc')
      user.valid?
      expect(user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
    end
  end
end
