require 'bookmark'

RSpec.describe Bookmark do

  subject { described_class.new('http://www.facebook.com', 'Facebook', 1) }

  it 'should have a url' do
    expect(subject.url).to eq 'http://www.facebook.com'
  end

  it 'should have a title' do
    expect(subject.title).to eq 'Facebook'
  end

  it 'should have a id' do
    expect(subject.id).to eq 1
  end
end
