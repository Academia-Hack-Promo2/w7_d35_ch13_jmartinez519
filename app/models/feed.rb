require 'reddit'
require 'mashable'
require 'digg'
class Feed
  include ActiveModel::Model
  
  def initialize site
    case site
     when "reddit"
       @r = Reddit.new
       @reddit = @r.format @r.getjson
     when "mashable"
       @m = Mashable.new
       @mashable = @m.format @m.getjson
     when "digg"
       @d = Digg.new
       @digg = @d.format @d.getjson
     else
      return {message: "The news site #{site} is not supported yet"}
    end
  end

  def show site
    case site
    when "reddit"
      return @reddit
    when "mashable"
      return @mashable
    when "digg"
      return @digg
    end
  end

  def one_article(site, id) 
    case site
    when "reddit"
      return @reddit[id]
    when "mashable"
      return @mashable[id]
    when "digg"
      return @digg[id]
    end
  end

  def author(site, name) 
    case site
    when "reddit"
      author_news = []
      @reddit.each do |news| 
        if news.author == name
          author_news << news
        end
      end
      return author_news
    when "mashable"
      author_news = []
      @mashable.each do |news| 
        if news.author == name
          author_news << news
        end
      end
      return author_news
    when "digg"
      author_news = []
      @digg.each do |news| 
        if news.author == name
          author_news << news
        end
      end
      return author_news
    else
      return {message: "The news site #{site} is not supported yet"}
    end
  end

  def title(site, name) 
    case site
    when "reddit"
      title_news = []
      @reddit.each do |news| 
        if news.title == name
          title_news << news
        end
      end
      return title_news
    when "mashable"
      title_news = []
      @mashable.each do |news| 
        if news.title == name
          title_news << news
        end
      end
      return title_news
    when "digg"
      title_news = []
      @digg.collect do |news| 
        if news.title == name
           title_news << news
        end
      end
      return title_news
    else
      return {message: "The news site #{site} is not supported yet"}
    end
  end

  def date(site, d) 
    case site
    when "reddit" 
      date_news = []
      @reddit.each do |news| 
        puts news.date
        if news.date[0,7] == d
          date_news << news
        end
      end
      return date_news
    when "mashable"
      date_news = []
      @mashable.each do |news| 
        if news.date[0,7] == d
          date_news << news
        end
      end
      return date_news
    when "digg"
      date_news = []
      @digg.collect do |news|
        if news.date[0,7] == d
           date_news << news
        end
      end
      return date_news
      # return @digg.collect {|news| news.title == name}
    else
      return {message: "The news site #{site} is not supported yet"}
    end
  end

end
