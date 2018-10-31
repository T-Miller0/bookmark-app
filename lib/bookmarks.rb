require 'uri'
require_relative 'bookmark'
require_relative 'database'

class Bookmarks
  attr_reader :all_bookmarks

  def initialize
    @conn = Database.setup
  end

  def get_all_bookmarks
    result = @conn.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| Bookmark.new(bookmark['url'], bookmark['title'], bookmark['id']) }
  end

  def add_bookmark(url, title)
    @conn.exec("INSERT INTO bookmarks(url, title) VALUES('#{url}', '#{title}')") if valid_url?(url)
  end

  def valid_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

  def delete_id(id)
    @conn.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def update_id(id, url, title)
    @conn.exec("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id}")
  end
end
