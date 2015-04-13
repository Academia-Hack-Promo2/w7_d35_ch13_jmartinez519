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
      return {error: "Erro en nombre del sitio de noticias"}
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

  def author 
    @reddit[1]
  end


end
