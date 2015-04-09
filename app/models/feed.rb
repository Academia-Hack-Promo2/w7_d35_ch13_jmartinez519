class Feed
  include ActiveModel::Model
  # require 'httparty'
  require 'date'

  class Reddit
    include HTTParty
    base_uri 'http://www.reddit.com/.json?limit=10'

    def news
      response = self.class.get('')
      return response
    end

    def format response
      noticias = []
      response["data"]["children"].each do |new|
        res = {}      
        res["autor"] = new["data"]["author"]
        res["title"] = new["data"]["title"]
        res["created_utc"] = Time.at(new["data"]["created_utc"])
        res["url"] = new["data"]["url"] 
        noticias.push(res)
      end
      puts noticias
      return noticias
    end
  end


  class Mashable
    include HTTParty
    base_uri 'http://mashable.com/stories.json?limit=10'

    def news
      response = self.class.get('')
      return response
    end

    def format response
      noticias = []
      response["hot"].each do |new|
        res = {}
        res["author"] = new["author"]  
        res["title"] = new["title"]
        res["post_date"] = new["post_date"]
        res["link"] = new["link"]
        noticias.push(res)
      end
      return noticias
    end
  end

  class Digg
    include HTTParty
  end

  def main
    newsarr = []
    reddit_feed = Reddit.new
    formato_reddit = reddit_feed.format reddit_feed.news
    newsarr.push(formato_reddit)
    mashable_feed = Mashable.new
    formato_mashable = mashable_feed.format mashable_feed.news
    newsarr.push(formato_mashable)
    return newsarr
  end
end
