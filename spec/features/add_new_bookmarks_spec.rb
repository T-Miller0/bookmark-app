feature 'user can add new bookmarks' do
  scenario 'via a form' do
    visit '/bookmarks'
    fill_in :new_bookmark, with: 'https://www.facebook.com'
    click_button 'Submit'
    expect(page).to have_content 'https://www.facebook.com'
  end
end
