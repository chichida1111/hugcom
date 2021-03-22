require 'rails_helper'
RSpec.describe Service, type: :model do
  before do
    @service = FactoryBot.build(:service)
  end

  describe '決済の新規依頼' do
    context '決済の新規依頼できる時' do
      it '決済項目が選択されれば登録できる' do
        @service.service_type_id = 3
        expect(@service).to be_valid
      end
      it '単価が選択されれば登録できる' do
        @service.unit_price_id = 3
        expect(@service).to be_valid
      end
      it '回数を入力すれば登録できる' do
        @service.number_of_times = 100
        expect(@service).to be_valid
      end
      it '特記事項が未入力でも登録できる' do
        @service.teacher_comment = nil
        expect(@service).to be_valid
      end
    end

    context '決済の新規依頼できない時' do
      it '決済項目が未選択だと登録できない' do
        @service.service_type_id = 1
        @service.valid?
        expect(@service.errors.full_messages).to include("決済項目を選択してください")
      end
      it '決済項目が空だと登録できない' do
        @service.service_type_id = nil
        @service.valid?
        expect(@service.errors.full_messages).to include("決済項目を入力してください", "決済項目を選択してください")
      end
      it '単価が未選択だと登録できない' do
        @service.unit_price_id = 1
        @service.valid?
        expect(@service.errors.full_messages).to include("単価を選択してください")
      end
      it '単価が空だと登録できない' do
        @service.unit_price_id = nil
        @service.valid?
        expect(@service.errors.full_messages).to include("単価を入力してください", "単価を選択してください")
      end
      it '回数を入力しないと登録できない' do
        @service.number_of_times = nil
        @service.valid?
        expect(@service.errors.full_messages).to include("回数を入力してください", "回数は1以上の整数を入力してください")
      end
      it '回数が半角英語だと登録できない' do
        @service.number_of_times = "once"
        @service.valid?
        expect(@service.errors.full_messages).to include("回数は1以上の整数を入力してください")
      end
      it '回数が全角文字だと登録できない' do
        @service.number_of_times = "回数"
        @service.valid?
        expect(@service.errors.full_messages).to include("回数は1以上の整数を入力してください")
      end
      it '回数が半角英数混合ではだと登録できない' do
        @service.number_of_times = "2two"
        @service.valid?
        expect(@service.errors.full_messages).to include("回数は1以上の整数を入力してください")
      end
      it '回数に少数があると登録できない' do
        @service.number_of_times = 1.5
        @service.valid?
        expect(@service.errors.full_messages).to include("回数は1以上の整数を入力してください")
      end
      it '保護者が紐付いていないと登録できない' do
        @service.teacher_user = nil
        @service.valid?
        expect(@service.errors.full_messages).to include("保護者を入力してください")
      end
      it '連絡帳が紐付いていないと登録できない' do
        @service.contact = nil
        @service.valid?
        expect(@service.errors.full_messages).to include("連絡帳を入力してください")
      end
    end

  end



end