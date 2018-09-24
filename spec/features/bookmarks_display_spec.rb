feature 'View a list of bookmarks' do
  scenario 'view all bookmarks' do
    visit '/bookmarks'
    bookmarks = [
      'http://www.google.com',
      'http://www.makersacademy.com',
      'http://www.destroyallsoftware.com'
    ]
    bookmarks.each do |link|
      expect(page).to have_content(link)
    end
  end
end
