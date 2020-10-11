class ExhibitionsController < ApplicationController

  before_action :set_exhibition, only: [:edit, :show]

  def new
    @exhibition = Exhibition.new
    @exhibition.images.build
    @category_parent_array = Category.where(ancestry: nil)
  end

  def create
    @exhibition = Exhibition.new(exhibition_params)
    if @exhibition.save
      redirect_to root_path
    else
      redirect_to new_exhibition_path
    end
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def show
  end

  def confirm
    @exhibition = exhibition.new(exhibition_params)
    render :new if @post.invalid?
  end

  def edit
  end

  def update
  end

  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end

  def pay
    @exhibition = Exhibition.find(params[:id])

    if @exhibition.buyer_id.nil?
      card = Card.find_by(user_id: current_user.id)
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @exhibition.price,
        customer: card.customer_id,
        currency: 'jpy'
      )
      @exhibition.update(buyer_id: current_user.id)
      redirect_to root_path
      flash[:notice] = "購入が完了しました。"
    else
      redirect_to exhibition_path(@exhibition.id), alert: "売り切れています。"
    end
  end

  private
  def exhibition_params
    params.require(:exhibition).permit(:name, :explanatory, :cost, :prefecture_code, :day, :price, :status, :category_id,:brand_id, images_attributes: [:image, :id],).merge(user_id: current_user.id)
  end

end