feature 'user can add new bookmarks' do
  scenario 'via a form' do
    visit '/bookmarks'
    click_button 'Add new bookmark'
    fill_in :new_bookmark, with: 'https://www.facebook.com'
    fill_in :title, with: 'facebook'
    click_button 'Submit'
    expect(page).to have_selector "a[href='https://www.facebook.com']"
  end
end
