require 'pg'

class Bookmarks
  attr_reader :all_bookmarks

  def self.create
    @@bookmarks = Bookmarks.new
  end

  def self.instance
    @@bookmarks
  end

  def self.all
    conn = PG.connect(dbname: 'bookmark_manager')
    result = conn.exec("SELECT url FROM bookmarks")
    result.map { |bookmark| bookmark['url'] }
  end

end
