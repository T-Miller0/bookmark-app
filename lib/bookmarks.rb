class Bookmarks
  attr_reader :all_bookmarks

  def initialize(starting_list)
    @all_bookmarks = starting_list
  end

  def self.create(starting_list)
    @@bookmarks = Bookmarks.new(starting_list)
  end

  def self.instance
    @@bookmarks
  end 

end
