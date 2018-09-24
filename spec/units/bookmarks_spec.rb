require 'bookmarks'

RSpec.describe Bookmarks do

  subject { described_class.new }

  it 'should return a list of bookmarks when asked' do
    subject.get_bookmarks
    expect(subject.all_bookmarks).to be_an Array
  end

end
