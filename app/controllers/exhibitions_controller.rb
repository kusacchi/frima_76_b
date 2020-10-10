class ExhibitionsController < ApplicationController

  before_action :set_exhibition, only: [:edit, :show, :confirm, :update]

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


  def confirm
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

  private
  def exhibition_params

    params.require(:exhibition).permit(:name, :explanatory, :cost, :prefecture_code, :day, :price, :status, :category_id,:brand_id, images_attributes: [:image, :id, :_destroy]).merge(user_id: current_user.id)
  end

  def ensure_current_user
    exhibition = Exhibition.find(params[:id])
    if exhibition.user_id != current_user.id
      redirect_to root_path
    end

  end

  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end

end