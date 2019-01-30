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

  def self.create(url:)
    con = PG.connect(dbname: 'bookmark_manager_test')
    con.exec("INSERT INTO bookmarks (url) VALUES ('#{url}')")
  end
end
