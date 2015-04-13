require 'New'

class Mashable
  include ActiveModel::Model
  include HTTParty
  base_uri 'http://mashable.com/stories.json?limit=10'


  def getjson
    response = self.class.get('')
    return response
  end

  def format response
    noticias_mashable = []
    response["new"].each do |new|
      author = new["author"]  
      title = new["title"]
      date = new["post_date"]
      link = new["link"]
      feed = "mashable"
      noticias_mashable.push(new_instance = News.new(author, title, date, 
                            link, feed))
    end
    return noticias_mashable
  end
end
