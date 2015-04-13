class News

  attr_reader :author, :title, :date, :link, :feed 

  def initialize(author, title, date, link, feed)
    @author = author
    @title = title
    @date = date
    @link = link
    @feed = feed
  end

  def to_s
     format_news = "\n#{@author}"\
                   "\n#{@title}"\
                   "\n#{@date}"\
                   "\n#{@link}"\
                   "\n#{@feed}"
    return format_news
  end

end
