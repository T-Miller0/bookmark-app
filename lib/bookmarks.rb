require 'pg'

class Bookmarks
  attr_reader :all_bookmarks

  def initialize(database)
    @database = database
    @conn = PG.connect(dbname: 'bookmark_manager')
  end

  def get_all_bookmarks
    result = @conn.exec("SELECT url FROM bookmarks")
    result.map { |bookmark| bookmark['url'] }
  end

  def add_bookmark(url)
    @conn.exec("INSERT INTO bookmarks(url) VALUES('#{url}')")
  end
end
