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
    result = @conn.exec("SELECT url FROM bookmarks")
    result.map { |bookmark| bookmark['url'] }
  end

  def add_bookmark(url)
    @conn.exec("INSERT INTO bookmarks(url) VALUES('#{url}')") if valid_url?(url)
  end

  def valid_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
