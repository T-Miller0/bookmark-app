require 'pg'

class Bookmarks
  attr_reader :all_bookmarks

  def initialize
    @all_bookmarks = []
  end

  def self.create
    @@bookmarks = Bookmarks.new
  end

  def self.instance
    @@bookmarks
  end

  def get_bookmarks
    conn = PG.connect(dbname: 'bookmark_manager')
    conn.exec("SELECT url FROM bookmarks") do |result|
      result.each do |row|
        @all_bookmarks << row['url'] if !@all_bookmarks.include?(row['url'])
      end
    end
  end

end
