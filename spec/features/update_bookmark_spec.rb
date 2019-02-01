feature 'Update bookmark' do
  scenario 'User want to update bookmark' do
    bookmark=Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit ('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url', with: 'http://www.yahoo.com.hk')
    fill_in('title', with: 'Yahoo-HK')
    click_button('Update')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Yahoo-HK', href: 'http://www.yahoo.com.hk')

  end
end
