class ItemsController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
    @exhibitions = Exhibition.order("created_at DESC").limit(5)
  end
end
