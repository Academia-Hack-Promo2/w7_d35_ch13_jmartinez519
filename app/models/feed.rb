class Feed
  include ActiveModel::Model
  require 'httparty'
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

  def main
    newsarr = []
    reddit_feed = Reddit.new
    formato = reddit_feed.format reddit_feed.news
    newsarr.push(formato)
    # newsarr.push(reddit_feed.news)
    return newsarr
  end
end
