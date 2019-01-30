require 'pg'
require 'pry'

class Bookmark

  def self.all
    con = PG.connect( dbname: 'bookmark_manager' )
    url = con.exec("SELECT * from bookmarks")
    p "url 1"
    p url
    binding.pry
    url = url.map{|x| x["url"]}
    p "url 2"
    p url
  end
end

bookmarks = Bookmark.all
