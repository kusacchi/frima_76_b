class ItemsController < ApplicationController
  def index
    @exhibitions = Exhibition.order("created_at DESC").limit(5)
  end
end
