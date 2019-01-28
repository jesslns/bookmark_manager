feature 'The app is running' do
  scenario 'User visit the website' do
    visit ('/')
    expect(page).to have_content "Hello World"
  end
end
