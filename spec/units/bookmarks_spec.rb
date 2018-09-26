require 'bookmarks'

RSpec.describe Bookmarks do

  subject { described_class.new('bookmark_manager_test') }

  before(:each) do
    empty_test_database
    populate_test_database
  end

  it 'should return a list of bookmarks when asked' do
    expect(subject.get_all_bookmarks).to be_an Array
  end

end
