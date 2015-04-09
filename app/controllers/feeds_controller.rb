class FeedsController < ApplicationController

  def index
    list = Feed.new
    render json: list.main
  end

  def show
    find_news = Feed.find(permit)
  end

  private
    def permit
      params.require("news").permit(:site,:author,:title,:date)
    end
end
