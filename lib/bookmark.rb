require 'pg'

class Bookmark

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
    con = PG.connect( dbname: 'bookmark_manager_test' )
    else
    con = PG.connect( dbname: 'bookmark_manager' )
    end
    url = con.exec("SELECT * from bookmarks")
    url = url.map{|x| x["url"]}
  end
end
