feature 'can delete bookmarks' do
  scenario 'when the user asks to' do
    visit '/bookmarks'
    empty_test_database
    populate_test_database
    first('.bookmark').click_button 'Delete'
    expect(page).not_to have_content('Google')
  end
end
