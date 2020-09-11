class CardsController < ApplicationController

  require "payjp"

  def new
    # showアクション(登録クレジットカード詳細表示機能)実装時に追記。
  end

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

    if params["payjp_token"].blank?
      redirect_to action: "new", alert: "クレジットカードを登録できませんでした。"
    else

      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params["payjp_token"],
        metadata: {user_id: current_user.id}
      )

      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)

      if @card.save

      else
        redirect_to action: "create"
      end
    end
  end

end