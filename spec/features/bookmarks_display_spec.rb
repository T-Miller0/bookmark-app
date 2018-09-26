feature 'View a list of bookmarks' do
  scenario 'view all bookmarks' do
    visit '/bookmarks'
    empty_test_database
    populate_test_database
    bookmark_manager = Bookmarks.new("bookmark_manager_test")
    bookmark_manager.get_all_bookmarks.each do |link|
      expect(page).to have_content(link)
    end
  end
end
