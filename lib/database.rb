require 'pg'

class Database

  def self.setup
    PG.connect(dbname: self.dbase)
  end

  def self.dbase
    ENV['ENVIRONMENT'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
  end
end
