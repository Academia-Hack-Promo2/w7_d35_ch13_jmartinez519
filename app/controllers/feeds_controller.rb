class FeedsController < ApplicationController

  def showall
    list = Feed.new(params[:site])
    render json: list.show(params[:site])
  end

  def showone
    list = Feed.new(params[:site])
    render json: list.one_article(params[:site], params[:id].to_i)
  end


  def author 
    list = Feed.new(params[:site])
    render json: list.author(params[:site], params[:author])
  end

  def title
    list = Feed.new(params[:site])
    render json: list.title(params[:site], params[:title])
  end

  def date 
    render json: {messagge: "Hello"}
  end
end
