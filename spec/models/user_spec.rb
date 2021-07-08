require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録ができる場合' do
      it '全ての必須項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上半角英数字混合であれば登録できること' do
        @user.password = 'aaa123'
        @user.password_confirmation = 'aaa123'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'mailが空では登録できない' do
        @user.mail = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください", "メールアドレスは不正な値です")
      end
      it 'emailに＠がない場合は登録できない' do
        @user.mail = 'aaaemail'
        @user.valid? 
        expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
      end
      it '重複したmailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.mail = @user.mail
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが半角英字のみでは登録できないこと' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字両方を入力してください")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名を全角で入力してください")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
