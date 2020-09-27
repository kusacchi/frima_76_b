class ExhibitionsController < ApplicationController

  before_action :set_exhibition, only: [:edit, :show, :confirm, :update]

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
  end

  def edit
    # grandchild = @exhibition.category
    # child = grandchild.parent
    # # if @category_id == 46 or @category_id == 74 or @category_id == 134 or @category_id == 142 or @category_id == 147 or @category_id == 150 or @category_id == 158
    # # else
    # #  @parent_array = []
    # #  @parent_array << @item.category.parent.parent.name
    # #  @parent_array << @item.category.parent.parent.id
    # # end
    #  @category_children_array = Category.where(ancestry: child.ancestry)
    #  @child_array = []
    #  @child_array << child.name
    #  @child_array << child.id

    #  @category_grandchildren_array = Category.where(ancestry: grandchild.ancestry)
    #  @grandchild_array = []
    #  @grandchild_array << grandchild.name
    #  @grandchild_array << grandchild.id
  end

  def update
    if @exhibition.update(exhibition_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def exhibition_params
    params.require(:exhibition).permit(:name, :explanatory, :cost, :prefecture_code, :day, :price, :status, :category_id,:brand_id, images_attributes: [:image, :id],).merge(user_id: current_user.id)
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