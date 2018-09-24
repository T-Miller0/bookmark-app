require 'pg'

class Bookmarks
  attr_reader :all_bookmarks

  def initialize(database)
    @database = database
  end

  def self.create(database = "bookmark_manager")
    @@bookmarks = Bookmarks.new(database)
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
