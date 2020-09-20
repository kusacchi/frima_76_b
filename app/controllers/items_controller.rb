class ItemsController < ApplicationController
  def index
    @exhibitions = Exhibition.all.limit(5).order("created_at DESC")
  end
end
