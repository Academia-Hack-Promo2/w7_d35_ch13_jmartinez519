require 'New'

class Digg
  include ActiveModel::Model
  include HTTParty
  base_uri 'https://digg.com/api/news/popular.json?limit=10'


  def getjson
    response = self.class.get('')
    return response
  end

  def format response
    noticias_digg = []
    response["data"]["feed"].each do |new|
      author = new["content"]["author"] 
      title = new["content"]["title_alt"]
      date = Time.at(new["date_published"])
      link = new["content"]["url"]
      feed = "digg"
      noticias_digg.push(new_instance = News.new(author, title, date, link, 
                        feed))
    end
    return noticias_digg
  end

end
