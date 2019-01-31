feature 'List url' do
  scenario 'User visit the bookmarks page' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
    #connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com'), 'Makers Academy';")
    #connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    #connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit('/bookmarks')

    expect(page).to have_content "Makers"
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    #expect(page).to have_content "http://www.google.com"
    #expect(page).to have_content "http://www.destroyallsoftware.com"

  end
end
