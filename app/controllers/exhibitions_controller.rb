class ExhibitionsController < ApplicationController

  def new
    @exhibition = Exhibition.new
    @exhibition.images.build
    @category_parent_array = ["---"]
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

  private
  def exhibition_params
    params.require(:exhibition).permit(:name, :explanatory, :cost, :prefecture_code, :day, :price, :status, :category_id,:brand_id, images_attributes: {image: []}).merge(user_id: current_user.id)
  end

  def confirm
  end

end