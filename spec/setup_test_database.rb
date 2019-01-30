require 'pg'

def setup_test_database
p "Set up test database"

con = PG.connect(dbname: 'bookmark_manager_test')

# Clear bookmarks table
con.exec("TRUNCATE bookmarks;")

end
