class PurchasesController < ApplicationController

  require "payjp"

  def index
    @exhibition = Exhibition.find(params[:exhibition_id])
    @images = @exhibition.images.all

    if user_signed_in?
      @user = current_user

      if @user.card.present?
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        @card = Card.find_by(user_id: current_user.id)
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @customer_card = customer.cards.retrieve(@card.card_id)

        @card_brand = @customer_card.brand
        case @card_brand
        when "Visa"
          @card_src = "visa.png"
        when "JCB"
          @card_src = "JCB.png"
        when "MasterCard"
          @card_src = "mastercard.png"
        when "AmericanExpress"
          @card_src = "AmericanExpress.png"
        end

        @exp_month = @customer_card.exp_month.to_s
        @exp_year = @customer_card.exp_year.to_s.slice(2,3)
      else
      end

    else
      redirect_to user_session_path, alert: "ログインしてください。"
    end
  end

end