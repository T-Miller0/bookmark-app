feature 'user can comment on the bookmark' do
  scenario 'shows comment along side link' do
    visit '/bookmarks'
    empty_test_database
    populate_test_database
    first('.bookmark').click_button 'comment'
    fill_in :comment, with: 'Test comment'
    click_button 'submit'
    expect(page).to have_content 'Test comment'
  end
end
