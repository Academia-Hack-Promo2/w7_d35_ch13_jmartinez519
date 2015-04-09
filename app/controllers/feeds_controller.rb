class FeedsController < ApplicationController

  def index
    list = Feed.new
    render json: list.main
  end

end
