feature 'user cannot add invlaid bookmarks' do
  scenario 'via a form' do
    visit '/bookmarks'
    click_button 'Add new bookmark'
    fill_in :new_bookmark, with: 'Billy'
    click_button 'Submit'
    expect(page).to have_content 'Bookmark invalid'
  end
end
