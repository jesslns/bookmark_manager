require 'pg'

class Bookmark

  def self.all
    con = PG.connect( dbname: 'bookmark_manager' )
    url = con.exec("SELECT * from bookmarks")
    url = url.map{|x| x["url"]}
  end
end
