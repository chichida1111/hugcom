class ParentUsersController < ApplicationController

  def show
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    card = Card.find_by(parent_user_id: current_parent_user.id) # ユーザーのid情報を元に、カード情報を取得

    redirect_to new_card_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token) # 先程のカード情報を元に、顧客情報を取得
    @card = customer.cards.first
  end

  def update
    if current_parent_user.update(parent_user_params) # 更新出来たかを条件分岐する
      redirect_to root_path # 更新できたらrootパスへ
    else
      redirect_to "show" # 失敗すれば再度マイページへ
    end
  end

  private

  def parent_user_params
    params.require(:parent_user).permit(:email, :last_name_p_j,:first_name_p_j,:last_name_p_k,:first_name_p_k,:group_id) 
    # 編集出来る情報を制限
  end

end