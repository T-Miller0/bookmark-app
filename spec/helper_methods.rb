require 'pg'

def empty_test_database
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec('TRUNCATE comment, bookmarks RESTART IDENTITY;')
end

def populate_test_database
  conn = PG.connect(dbname: 'bookmark_manager_test')
  test_urls = [
    ['http://www.google.com', 'Google'],
    ['http://www.makersacademy.com', 'Makers'],
    ['http://www.destroyallsoftware.com', 'DestroyAllSoftware']
  ]
  test_urls.each do |bookmark|
    conn.exec("INSERT INTO bookmarks(url, title) VALUES('#{bookmark[0]}', '#{bookmark[1]}')")
  end
end
