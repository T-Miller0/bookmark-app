require 'bookmarks'

RSpec.describe Bookmarks do

  subject { described_class.new }

  it 'should return a list of bookmarks when asked' do
    expect(Bookmarks.all).to be_an Array
  end

end
