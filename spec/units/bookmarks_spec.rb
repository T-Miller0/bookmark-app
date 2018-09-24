require 'bookmarks'

RSpec.describe Bookmarks do

  subject { described_class.new }
  Bookmarks.create("bookmark_manager_test")

  before(:each) do
    empty_test_database
    populate_test_database
  end

  it 'should return a list of bookmarks when asked' do
    expect(Bookmarks.all).to be_an Array
  end

end
