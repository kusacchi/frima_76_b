class ItemsController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end
end
