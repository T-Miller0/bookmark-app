require 'pg'

def empty_test_database
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec('TRUNCATE bookmarks RESTART IDENTITY;')
end

def populate_test_database
  conn = PG.connect(dbname: 'bookmark_manager_test')
  test_urls = [
    'http://www.google.com',
    'http://www.makersacademy.com',
    'http://www.destroyallsoftware.com'
  ]
  test_urls.each do |url|
    conn.exec("INSERT INTO bookmarks(url) VALUES('#{url}')")
  end
end
