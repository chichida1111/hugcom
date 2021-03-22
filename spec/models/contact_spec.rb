require 'rails_helper'
RSpec.describe Contact, type: :model do
  before do
    @contact = FactoryBot.build(:contact)
  end

  describe '連絡帳の新規作成' do
    context '連絡帳を新規作成できる時' do
      it 'お子さんの名字が全角（漢字・ひらがな・カタカナ）で入力されれば登録できる' do
        @contact.last_name_c_j = '漢字ひらがなカタカナ'
        expect(@contact).to be_valid
      end
      it 'お子さんの名前が全角（漢字・ひらがな・カタカナ）で入力されれば登録できる' do
        @contact.first_name_c_j = '漢字ひらがなカタカナ'
        expect(@contact).to be_valid
      end
      it 'お子さんの名字（カナ）が全角（カタカナ）で入力されれば登録できる' do
        @contact.last_name_c_k = 'カタカナ'
        expect(@contact).to be_valid
      end
      it 'お子さんの名前（カナ）が全角（カタカナ）で入力されれば登録できる' do
        @contact.first_name_c_k = 'カタカナ'
        expect(@contact).to be_valid
      end
      it '担当の組を入力すると登録できる' do
        @contact.group_id = 4
        expect(@contact).to be_valid
      end
      it '全て揃っていれば登録できる' do
        expect(@contact).to be_valid
      end
    end

    context '連絡帳を新規作成できない時' do
      it 'お子さんの名字（漢字・ひらがな・カタカナ）が空では登録できない' do
        @contact.last_name_c_j = ''
        @contact.valid?
        expect(@contact.errors.full_messages).to include("お子さんの名字（漢字・ひらがな・カタカナ）を入力してください", "お子さんの名字（漢字・ひらがな・カタカナ）は全角文字を使用してください")
      end
      it 'お子さんの名前（漢字・ひらがな・カタカナ）が空では登録できない' do
        @contact.first_name_c_j = ''
        @contact.valid?
        expect(@contact.errors.full_messages).to include("お子さんの名前（漢字・ひらがな・カタカナ）を入力してください", "お子さんの名前（漢字・ひらがな・カタカナ）は全角文字を使用してください")
      end
      it 'お子さんの名字は、全角（漢字・ひらがな・カタカナ）で入力しない場合は登録できない' do
        @contact.last_name_c_j = 'myouji'
        @contact.valid?
        expect(@contact.errors.full_messages).to include("お子さんの名字（漢字・ひらがな・カタカナ）は全角文字を使用してください")
      end
      it 'お子さんの名前は、全角（漢字・ひらがな・カタカナ）で入力しない場合は登録できない' do
        @contact.first_name_c_j = 'namae'
        @contact.valid?
        expect(@contact.errors.full_messages).to include("お子さんの名前（漢字・ひらがな・カタカナ）は全角文字を使用してください")
      end
      it 'お子さんの名字のフリガナは、空では登録できない' do
        @contact.last_name_c_k = ''
        @contact.valid?
        expect(@contact.errors.full_messages).to include("お子さんの名字（カナ）を入力してください", "お子さんの名字（カナ）は全角（カタカナ）を使用してください")
      end
      it 'お子さんの名前のフリガナは、空では登録できない' do
        @contact.first_name_c_k = ''
        @contact.valid?
        expect(@contact.errors.full_messages).to include("お子さんの名前（カナ）を入力してください", "お子さんの名前（カナ）は全角（カタカナ）を使用してください")
      end
      it 'お子さんの名前のフリガナは、全角（カタカナ）で入力しない場合は登録できない' do
        @contact.last_name_c_k = '名字'
        @contact.valid?
        expect(@contact.errors.full_messages).to include("お子さんの名字（カナ）は全角（カタカナ）を使用してください")
      end
      it 'お子さんの名前のフリガナは、全角（カタカナ）で入力しない場合は登録できない' do
        @contact.first_name_c_k = '名前'
        @contact.valid?
        expect(@contact.errors.full_messages).to include("お子さんの名前（カナ）は全角（カタカナ）を使用してください")
      end
      it 'お子さんの組を選択しないと登録できない' do
        @contact.group_id = 1
        @contact.valid?
        expect(@contact.errors.full_messages).to include("お子さんの組を選択してください")
      end
      it 'お子さんの組が空だと登録できない' do
        @contact.group_id = nil
        @contact.valid?
        expect(@contact.errors.full_messages).to include("お子さんの組を入力してください", "お子さんの組を選択してください")
      end
      it '保護者が紐付いていないと登録できない' do
        @contact.parent_user = nil
        @contact.valid?
        expect(@contact.errors.full_messages).to include("保護者を入力してください")
      end
      it '画像が空だと登録できない' do
        @contact.image = nil
        @contact.valid?
        expect(@contact.errors.full_messages).to include("写真を入力してください")
      end
    end
  end
  


end