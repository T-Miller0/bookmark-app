require 'bookmarks'

RSpec.describe Bookmarks do

  default_list = ['www.bbc.co.uk', 'www.google.co.uk', 'www.youtube.com']

  subject { described_class.new(default_list) }

  it 'should return a list of bookmarks when asked' do
    expect(subject.all_bookmarks).to eq default_list
  end
end
