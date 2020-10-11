class ExhibitionsController < ApplicationController

  before_action :set_exhibition, only: [:edit, :show, :update]

  def new
    @exhibition = Exhibition.new
    @exhibition.images.build
    @category_parent_array = Category.where(ancestry: nil)
    @exhibition.build_brand
  end

  def create
    @exhibition = Exhibition.new(exhibition_params)
    if params[:img] != nil
      img = MiniMagick::Image.read(params[:img])
      img.resize_to_limit "650x387"
      img.write "public/uploads/image"
    end

    if @exhibition.save
      redirect_to exhibition_path(@exhibition)
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
    @exhibition = Exhibition.find(params[:id])
    @parents = Category.where(ancestry:nil)
  end

  def destroy
    @exhibition = Exhibition.find(params[:id])
    if @exhibition.user_id == current_user.id && @exhibition.destroy
      redirect_to root_path, notice: '商品が削除されました'
    else
      flash.now[:alert] = '商品の削除に失敗しました'
      render :show
    end
  end

  def confirm
    @exhibition = exhibition.new(exhibition_params)
    render :new if @post.invalid?
  end

  def edit
    @exhibition.images.build
  end

  def update
    if @exhibition.update(exhibition_params)
      redirect_to exhibition_path
    else
      render :edit
    end
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

  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end

  private
  def exhibition_params
    params.require(:exhibition).permit(:name, :explanatory, :cost, :prefecture_code, :day, :price, :status, :category_id, images_attributes: [:image, :id, :_destroy],brand_attributes: [:id, :name]).merge(user_id: current_user.id)
  end

  def ensure_current_user
    exhibition = Exhibition.find(params[:id])
    if exhibition.user_id != current_user.id
      redirect_to root_path
    end
  end

end