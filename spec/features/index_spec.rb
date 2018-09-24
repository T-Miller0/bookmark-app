feature 'Visiting the home page' do
  scenario 'User is welcomed' do
    visit '/'
    expect(page).to have_content 'Welcome to Bokkmarkz'
  end
end
