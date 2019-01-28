feature 'View bookmarks' do
  scenario 'User visit the bookmarks page' do
    visit('/bookmarks')
    expect(page).to have_content "www.yahoo.com.hk"
    expect(page).to have_content "www.google.com"
  end
end
