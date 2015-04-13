require 'New'


class Reddit
  include ActiveModel::Model
  include HTTParty
  base_uri 'http://www.reddit.com/.json?limit=10'

    def getjson
      response = self.class.get('')
      return response
    end

  def format response
    noticias_reddit = []
      response["data"]["children"].each do |new|     
        author = new["data"]["author"]
        title = new["data"]["title"]
        date = Time.at(new["data"]["created_utc"])
        link = new["data"]["url"]
        feed = "reddit" 
        noticias_reddit.push(new_instance = News.new(author, title, date, 
                            link, feed))
      end
    return noticias_reddit
  end
end
