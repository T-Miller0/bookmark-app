feature 'can edit bookmarks' do
  scenario 'when the user asks to' do
    visit '/bookmarks'
    empty_test_database
    populate_test_database
    first('.bookmark').click_button 'Edit'
    fill_in 'new_bookmark', with: 'https://www.google.com'
    fill_in 'new_title', with: 'GOOOOOGLE'
    click_button 'Submit'
    expect(page).to have_content('GOOOOOGLE')
  end
end
