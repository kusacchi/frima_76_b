class CardsController < ApplicationController
  before_action :set_card, only: [:show, :destroy, :new]

  require "payjp"

  def new
    redirect_to cards_path(current_user.id) if @card.present?
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]

    if params["payjp_token"].blank?
      redirect_to new_card_path
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params["payjp_token"],
        metadata: {user_id: current_user.id}
      )
      binding.pry
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)

      if @card.save
        redirect_to card_path(current_user.id), notice: "クレジットカード情報を登録しました。"
      else
        redirect_to new_card_path, notice: "クレジットカード情報の登録に失敗しました。"
      end
    end

  end

  def show
    if @card.blank?
      redirect_to new_card_path
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
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
    end
  end

  def destroy
    if @card.blank?
      redirect_to new_card_path
    else

      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      if @card.destroy
        redirect_to user_path(current_user.id), notice: "削除されました。"
      else
        redirect_to card_path(current_user.id), notice: "削除できませんでした。"
      end
    end
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

end