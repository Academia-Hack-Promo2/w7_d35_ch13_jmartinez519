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
    base_uri 'https://digg.com/api/news/popular.json'

    def news
      response = self.class.get('')
      return response
    end

    def format response
      noticias = []
      response["data"]["feed"].each do |new|
        res = {}
        res["author"] = new["content"]["author"] 
        res["title_alt"] = new["content"]["title_alt"]
        res["date_published"] = Time.at(new["date_published"])
        res["url"] = new["content"]["url"]
        noticias.push(res)
      end
      return noticias
    end
  end

  def main
    @newsarr = []
    reddit_feed = Reddit.new
    formato_reddit = reddit_feed.format reddit_feed.news
    @newsarr.push(formato_reddit)
    mashable_feed = Mashable.new
    formato_mashable = mashable_feed.format mashable_feed.news
    @newsarr.push(formato_mashable)
    digg_feed = Digg.new
    formato_digg = digg_feed.format digg_feed.news
    @newsarr.push(formato_digg)
    return @newsarr
  end

end
