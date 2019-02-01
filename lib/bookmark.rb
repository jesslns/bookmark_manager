require 'pg'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect( dbname: 'bookmark_manager_test' )
    else
      con = PG.connect( dbname: 'bookmark_manager' )
    end
    data = con.exec("SELECT * from bookmarks")
    data.map do |bookmark|
      Bookmark.new(id: bookmark["id"], title: bookmark["title"], url: bookmark["url"])
      # calling Class.new to store (ie wrap) data, to make data its own class object
      # go from being an agency to transfer data to a factory of repackaging into its own product
    end
  end

  def self.create(url:, title: )
    # same as passing (url: url, title: title) value by default has same name as key.
    # use of hash is useful when we are not sure what the variable will be
    # return false unless is_url?(url)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect( dbname: 'bookmark_manager' )
    end
    result = con.exec("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}') RETURNING id, title, url")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect( dbname: 'bookmark_manager' )
    end
    con.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end

  # def self.update(id:)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     con = PG.connect(dbname: 'bookmark_manager_test')
  #   else
  #     con = PG.connect( dbname: 'bookmark_manager' )
  #   end
  #   con.exec("UPDATE bookmarks SET url=#{url} title=#{title} WHERE id = #{id}")
  # end
end
