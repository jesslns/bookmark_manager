feature 'Add bookmarks' do
  scenario 'User add new bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.yahoo.com.hk')
    click_button('Submit')

    expect(page).to have_content "http://www.yahoo.com.hk"
  end
end
