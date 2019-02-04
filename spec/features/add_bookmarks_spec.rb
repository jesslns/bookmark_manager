feature 'Add bookmarks' do
  scenario 'User add new bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.yahoo.com.hk')
    fill_in('title', with: 'Yahoo-HK')
    click_button('Submit')

    expect(page).to have_link('Yahoo-HK', href: 'http://www.yahoo.com.hk')
  end

  # scenario 'The bookmark must be a valid URL' do
  # visit('/bookmarks/new')
  # fill_in('url', with: 'not a real bookmark')
  # click_button('Submit')
  #
  # expect(page).not_to have_content "not a real bookmark"
  # expect(page).to have_content "You must submit a valid URL."
  # end

end
