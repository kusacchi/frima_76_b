class ItemsController < ApplicationController
  def index
    # @exhibitions = Exhibition.find(1)
    @exhibitions = Exhibition.all.limit(5).order("created_at DESC")
    # @images = Image.all
  end
end
