feature 'View a list of bookmarks' do
  scenario 'view all bookmarks' do
    visit '/bookmarks'
    empty_test_database
    populate_test_database
    Bookmarks.create("bookmark_manager_test")
    Bookmarks.all.each do |link|
      expect(page).to have_content(link)
    end
  end
end
