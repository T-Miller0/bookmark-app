require 'bookmarks'

RSpec.describe Bookmarks do

  subject { described_class.new }

  before(:each) do
    empty_test_database
    populate_test_database
  end

  it 'should return a list of bookmarks when asked' do
    expect(subject.get_all_bookmarks).to be_an Array
  end

  it 'can recognise valid urls' do
    expect(subject.valid_url?('http://www.google.com')).to eq 0
  end

  it 'can recognise invalid urls' do
    expect(subject.valid_url?('billy')).to eq nil
  end
end
