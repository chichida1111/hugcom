class ServicesController < ApplicationController
  before_action :find_service, only: :order  # 「find_item」を動かすアクションを限定

  def new
    @service = Service.new
    @contact = Contact.find(params[:contact_id])
  end

  def create
    @service = Service.create(service_params)
    @contact = Contact.find(params[:contact_id])
    if @service.save
      redirect_to contact_path(@contact.id), method: :get
    else
      render :new
    end
  end

  def order # 購入する時のアクションを定義
    redirect_to new_card_path and return unless current_parent_user.card.present?
  
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer_token = current_parent_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
      amount: @service.unit_price.unit_price * @service.number_of_times , # 商品の値段
      customer: customer_token, # 顧客のトークン
      currency: 'jpy' # 通貨の種類（日本円）
      )

      ServiceOrder.create(service_id: params[:id]) # 商品のid情報を「item_id」として保存する
      
      redirect_to root_path
  end

  private
  def service_params
    params.require(:service).permit(:service_type_id, :unit_price_id, :number_of_times, :teacher_comment ).merge(teacher_user_id: current_teacher_user.id, contact_id: params[:contact_id])
  end
 
  def find_service
    @service = Service.find(params[:id]) # 購入する商品を特定
  end

end