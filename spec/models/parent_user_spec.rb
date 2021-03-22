require 'rails_helper'
RSpec.describe ParentUser, type: :model do
  before do
    @parent_user = FactoryBot.build(:parent_user)
  end

  describe '保護者の新規登録' do
    context '保護者を新規登録できる時' do
      it 'パスワードとパスワード（確認用）は6文字以上の半角英数混合が入力されていれば、登録できる' do
        @parent_user.password = '123aaaaaa'
        @parent_user.password_confirmation = '123aaaaaa'
        expect(@parent_user).to be_valid
      end
      it '保護者の名字が全角（漢字・ひらがな・カタカナ）で入力されれば登録できる' do
        @parent_user.last_name_p_j = '漢字ひらがなカタカナ'
        expect(@parent_user).to be_valid
      end
      it '保護者の名前が全角（漢字・ひらがな・カタカナ）で入力されれば登録できる' do
        @parent_user.first_name_p_j = '漢字ひらがなカタカナ'
        expect(@parent_user).to be_valid
      end
      it '保護者の名字（カナ）が全角（カタカナ）で入力されれば登録できる' do
        @parent_user.last_name_p_k = 'カタカナ'
        expect(@parent_user).to be_valid
      end
      it '保護者の名前（カナ）が全角（カタカナ）で入力されれば登録できる' do
        @parent_user.first_name_p_k = 'カタカナ'
        expect(@parent_user).to be_valid
      end
      it '電話番号は半角数値で10桁で入力されれば登録できる' do
        @parent_user.phone_number = '1234567890'
        expect(@parent_user).to be_valid
      end
      it '電話番号は半角数値で11桁で入力されれば登録できる' do
        @parent_user.phone_number = '12345678901'
        expect(@parent_user).to be_valid
      end
      it 'お子さんの組を入力すると登録できる' do
        @parent_user.group_id = 4
        expect(@parent_user).to be_valid
      end
      it '全て揃っていれば登録できる' do
        expect(@parent_user).to be_valid
      end
    end

    context '保護者を新規登録できない時' do
      it 'Eメールが空だと登録できない' do
        @parent_user.email = ''
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したEメールが存在する場合登録できない' do
        @parent_user.save
        another_parent_user = FactoryBot.build(:parent_user)
        another_parent_user.email = @parent_user.email
        another_parent_user.valid?
        expect(another_parent_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'メールアドレスは、@を含まないと登録できない' do
        @parent_user.email = 'testemail'
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'パスワードが空では登録できない' do
        @parent_user.password = ''
        @parent_user.password_confirmation = ''
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("パスワードを入力してください", "パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'パスワードは、5文字以下では登録できない' do
        @parent_user.password = 'a1234'
        @parent_user.password_confirmation = 'a1234'
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'パスワードは、半角数字のみの入力では登録できない' do
        @parent_user.password = '12345678'
        @parent_user.password_confirmation = '12345678'
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'パスワードは、半角英字のみの入力では登録できない' do
        @parent_user.password = 'abcdefgh'
        @parent_user.password_confirmation = 'abcdefgh'
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'パスワードは、全角での入力では登録できない' do
        @parent_user.password = 'テストパスワード'
        @parent_user.password_confirmation = 'テストパスワード'
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'パスワードは、確認用を含めて2回、入力しない場合は登録できない' do
        @parent_user.password = '1234aaa'
        @parent_user.password_confirmation = ''
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("パスワード（再入力）とパスワードの入力が一致しません")
      end
      it 'パスワードとパスワード（確認用）が異なる場合は登録できない' do
        @parent_user.password = '1234aaa'
        @parent_user.password_confirmation = '1111bbb'
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("パスワード（再入力）とパスワードの入力が一致しません")
      end
      it '保護者の名字（漢字・ひらがな・カタカナ）が空では登録できない' do
        @parent_user.last_name_p_j = ''
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("保護者の名字（漢字・ひらがな・カタカナ）を入力してください", "保護者の名字（漢字・ひらがな・カタカナ）は全角文字を使用してください")
      end
      it '保護者の名前（漢字・ひらがな・カタカナ）が空では登録できない' do
        @parent_user.first_name_p_j = ''
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("保護者の名前（漢字・ひらがな・カタカナ）を入力してください", "保護者の名前（漢字・ひらがな・カタカナ）は全角文字を使用してください")
      end
      it '保護者の名字は、全角（漢字・ひらがな・カタカナ）で入力しない場合は登録できない' do
        @parent_user.last_name_p_j = 'myouji'
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("保護者の名字（漢字・ひらがな・カタカナ）は全角文字を使用してください")
      end
      it '保護者の名前は、全角（漢字・ひらがな・カタカナ）で入力しない場合は登録できない' do
        @parent_user.first_name_p_j = 'namae'
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("保護者の名前（漢字・ひらがな・カタカナ）は全角文字を使用してください")
      end
      it '保護者の名字のフリガナは、空では登録できない' do
        @parent_user.last_name_p_k = ''
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("保護者の名字（カナ）を入力してください", "保護者の名字（カナ）は全角（カタカナ）を使用してください")
      end
      it '保護者の名前のフリガナは、空では登録できない' do
        @parent_user.first_name_p_k = ''
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("保護者の名前（カナ）を入力してください", "保護者の名前（カナ）は全角（カタカナ）を使用してください")
      end
      it '保護者の名前のフリガナは、全角（カタカナ）で入力しない場合は登録できない' do
        @parent_user.last_name_p_k = '名字'
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("保護者の名字（カナ）は全角（カタカナ）を使用してください")
      end
      it '保護者の名前のフリガナは、全角（カタカナ）で入力しない場合は登録できない' do
        @parent_user.first_name_p_k = '名前'
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("保護者の名前（カナ）は全角（カタカナ）を使用してください")
      end
      it '電話番号が空だと登録できない' do
        @parent_user.phone_number = ""
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("電話番号を入力してください", "電話番号は半角数字で10〜11桁で入力してください")
      end
      it '電話番号が9桁だと登録できない' do
        @parent_user.phone_number = "123456789"
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("電話番号は半角数字で10〜11桁で入力してください")
      end
      it '電話番号が12桁だと登録できない' do
        @parent_user.phone_number = "123456789012"
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("電話番号は半角数字で10〜11桁で入力してください")
      end
      it '電話番号が文字列（全角）だと登録できない' do
        @parent_user.phone_number = "電話番号"
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("電話番号は半角数字で10〜11桁で入力してください")
      end
      it '電話番号が文字列（半角英語）だと登録できない' do
        @parent_user.phone_number = "phonenumber"
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("電話番号は半角数字で10〜11桁で入力してください")
      end
      it '電話番号が文字列（英数混合）だと登録できない' do
        @parent_user.phone_number = "090phone123"
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("電話番号は半角数字で10〜11桁で入力してください")
      end
      it '電話番号が数値（全角）だと登録できない' do
        @parent_user.phone_number = "１２３４５６７８９０１"
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("電話番号は半角数字で10〜11桁で入力してください")
      end
      it 'お子さんの組が未選択だと登録できない' do
        @parent_user.group_id = 1
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("お子さんの組を選択してください")
      end
      it 'お子さんの組が空だと登録できない' do
        @parent_user.group_id = nil
        @parent_user.valid?
        expect(@parent_user.errors.full_messages).to include("お子さんの組を入力してください", "お子さんの組を選択してください")
      end
    end
  end
end