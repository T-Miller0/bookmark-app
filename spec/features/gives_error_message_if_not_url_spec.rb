feature 'user cannot add invlaid bookmarks' do
  scenario 'via a form' do
    visit '/bookmarks'
    click_button 'Add new bookmark'
    fill_in :new_bookmark, with: 'Billy'
    fill_in :title, with: 'Billy'
    click_button 'Submit'
    expect(page).to have_content 'Bookmark invalid'
  end
end

feature 'user must specify title' do
  scenario 'title empty' do
    visit '/bookmarks'
    click_button 'Add new bookmark'
    fill_in :new_bookmark, with: 'http://www.facebook.com'
    click_button 'Submit'
    expect(page).to have_content 'Title invalid'
  end
end
