feature 'View a list of bookmarks' do
  scenario 'view all bookmarks'do
    visit '/'
    bookmarks = ['www.bbc.co.uk', 'www.google.co.uk', 'www.youtube.com']
    bookmarks.each do |link|
      expect(page).to have_content(link)
    end 
  end
end
