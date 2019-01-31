feature 'Add bookmarks' do
  scenario 'User add new bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.yahoo.com.hk')
    fill_in('title', with: 'Yahoo-HK')
    click_button('Submit')

    expect(page).to have_link('Yahoo-HK', href: 'http://www.yahoo.com.hk')
  end
end
