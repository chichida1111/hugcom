require 'rails_helper'
RSpec.describe TeacherUser, type: :model do
  before do
    @teacher_user = FactoryBot.build(:teacher_user)
  end

  describe '先生の新規登録' do
    context '先生を新規登録できる時' do
      it 'パスワードとパスワード（確認用）は6文字以上の半角英数混合が入力されていれば、登録できる' do
        @teacher_user.password = '123aaaaaa'
        @teacher_user.password_confirmation = '123aaaaaa'
        expect(@teacher_user).to be_valid
      end
      it '先生の名字が全角（漢字・ひらがな・カタカナ）で入力されれば登録できる' do
        @teacher_user.last_name_t_j = '漢字ひらがなカタカナ'
        expect(@teacher_user).to be_valid
      end
      it '先生の名前が全角（漢字・ひらがな・カタカナ）で入力されれば登録できる' do
        @teacher_user.first_name_t_j = '漢字ひらがなカタカナ'
        expect(@teacher_user).to be_valid
      end
      it '先生の名字（カナ）が全角（カタカナ）で入力されれば登録できる' do
        @teacher_user.last_name_t_k = 'カタカナ'
        expect(@teacher_user).to be_valid
      end
      it '先生の名前（カナ）が全角（カタカナ）で入力されれば登録できる' do
        @teacher_user.first_name_t_k = 'カタカナ'
        expect(@teacher_user).to be_valid
      end
      it '担当の組を入力すると登録できる' do
        @teacher_user.group_id = 4
        expect(@teacher_user).to be_valid
      end
      it '全て揃っていれば登録できる' do
        expect(@teacher_user).to be_valid
      end
    end

    context '先生を新規登録できない時' do
      it 'Eメールが空だと登録できない' do
        @teacher_user.email = ''
        @teacher_user.valid?
        expect(@teacher_user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したEメールが存在する場合登録できない' do
        @teacher_user.save
        another_teacher_user = FactoryBot.build(:teacher_user)
        another_teacher_user.email = @teacher_user.email
        another_teacher_user.valid?
        expect(another_teacher_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'メールアドレスは、@を含まないと登録できない' do
        @teacher_user.email = 'testemail'
        @teacher_user.valid?
        expect(@teacher_user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'パスワードが空では登録できない' do
        @teacher_user.password = ''
        @teacher_user.encrypted_password = ''
        @teacher_user.valid?
        expect(@teacher_user.errors.full_messages).to include("パスワードを入力してください", "パスワード（再入力）とパスワードの入力が一致しません", "パスワード（再入力）を入力してください")
      end
      it 'パスワードは、5文字以下では登録できない' do
        @teacher_user.password = 'a1234'
        @teacher_user.password_confirmation = 'a1234'
        @teacher_user.valid?
        expect(@teacher_user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'パスワードは、半角数字のみの入力では登録できない' do
        @teacher_user.password = '12345678'
        @teacher_user.password_confirmation = '12345678'
        @teacher_user.valid?
        expect(@teacher_user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'パスワードは、半角英字のみの入力では登録できない' do
        @teacher_user.password = 'abcdefgh'
        @teacher_user.password_confirmation = 'abcdefgh'
        @teacher_user.valid?
        expect(@teacher_user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'パスワードは、全角での入力では登録できない' do
        @teacher_user.password = 'テストパスワード'
        @teacher_user.password_confirmation = 'テストパスワード'
        @teacher_user.valid?
        expect(@teacher_user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'パスワードは、確認用を含めて2回、入力しない場合は登録できない' do
        @teacher_user.password = '1234aaa'
        @teacher_user.password_confirmation = ''
        @teacher_user.valid?
        expect(@teacher_user.errors.full_messages).to include("パスワード（再入力）とパスワードの入力が一致しません")
      end
      it 'パスワードとパスワード（確認用）が異なる場合は登録できない' do
        @teacher_user.password = '1234aaa'
        @teacher_user.password_confirmation = '1111bbb'
        @teacher_user.valid?
        expect(@teacher_user.errors.full_messages).to include("パスワード（再入力）とパスワードの入力が一致しません")
      end
      it '先生の名字（漢字・ひらがな・カタカナ）が空では登録できない' do
        @teacher_user.last_name_t_j = ''
        @teacher_user.valid?
        expect(@teacher_user.errors.full_messages).to include("先生の名字（漢字・ひらがな・カタカナ）を入力してください", "先生の名字（漢字・ひらがな・カタカナ）は全角文字を使用してください")
      end
      it '先生の名前（漢字・ひらがな・カタカナ）が空では登録できない' do
        @teacher_user.first_name_t_j = ''
        @teacher_user.valid?
        expect(@teacher_user.errors.full_messages).to include("先生の名前（漢字・ひらがな・カタカナ）を入力してください", "先生の名前（漢字・ひらがな・カタカナ）は全角文字を使用してください")
      end
      it '先生の名字は、全角（漢字・ひらがな・カタカナ）で入力しない場合は登録できない' do
        @teacher_user.last_name_t_j = 'myouji'
        @teacher_user.valid?
        expect(@teacher_user.errors.full_messages).to include("先生の名字（漢字・ひらがな・カタカナ）は全角文字を使用してください")
      end
      it '先生の名前は、全角（漢字・ひらがな・カタカナ）で入力しない場合は登録できない' do
        @teacher_user.first_name_t_j = 'namae'
        @teacher_user.valid?
        expect(@teacher_user.errors.full_messages).to include("先生の名前（漢字・ひらがな・カタカナ）は全角文字を使用してください")
      end
      it '先生の名字のフリガナは、空では登録できない' do
        @teacher_user.last_name_t_k = ''
        @teacher_user.valid?
        expect(@teacher_user.errors.full_messages).to include("先生の名字（カナ）を入力してください", "先生の名字（カナ）は全角（カタカナ）を使用してください")
      end
      it '先生の名前のフリガナは、空では登録できない' do
        @teacher_user.first_name_t_k = ''
        @teacher_user.valid?
        expect(@teacher_user.errors.full_messages).to include("先生の名前（カナ）を入力してください", "先生の名前（カナ）は全角（カタカナ）を使用してください")
      end
      it '先生の名前のフリガナは、全角（カタカナ）で入力しない場合は登録できない' do
        @teacher_user.last_name_t_k = '名字'
        @teacher_user.valid?
        expect(@teacher_user.errors.full_messages).to include("先生の名字（カナ）は全角（カタカナ）を使用してください")
      end
      it '先生の名前のフリガナは、全角（カタカナ）で入力しない場合は登録できない' do
        @teacher_user.first_name_t_k = '名前'
        @teacher_user.valid?
        expect(@teacher_user.errors.full_messages).to include("先生の名前（カナ）は全角（カタカナ）を使用してください")
      end
      it '担当の組が未選択だと登録できない' do
        @teacher_user.group_id = 1
        @teacher_user.valid?
        expect(@teacher_user.errors.full_messages).to include("担当の組を選択してください")
      end
      it '担当の組が空だと登録できない' do
        @teacher_user.group_id = nil
        @teacher_user.valid?
        expect(@teacher_user.errors.full_messages).to include("担当の組を入力してください", "担当の組を選択してください")
      end
    end
  end
end