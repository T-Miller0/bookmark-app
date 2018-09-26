require 'pg'
require 'uri'

class Bookmarks
  attr_reader :all_bookmarks

  def initialize
    if ENV['ENVIRONMENT'] == 'test'
      @conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      @conn = PG.connect(dbname: 'bookmark_manager')
    end
  end

  def get_all_bookmarks
    result = @conn.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| bookmark.values_at('url', 'title') }
  end

  def add_bookmark(url, title)
    @conn.exec("INSERT INTO bookmarks(url, title) VALUES('#{url}', '#{title}')") if valid_url?(url)
  end

  def valid_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
