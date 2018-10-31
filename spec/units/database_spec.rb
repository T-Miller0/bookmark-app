require 'database'

describe Database do
  describe 'testing uses test database' do
    it 'sets up a connection to test database' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      Database.setup
    end
  end
end
