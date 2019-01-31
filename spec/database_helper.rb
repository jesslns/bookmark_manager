require 'pg'

def persisted_data(id:)
  con = PG.connect(dbname: 'bookmark_manager_test')
  data = con.query("SELECT * FROM bookmarks WHERE id = #{id};")
  data.first
end
