require 'bookmark'
require 'pg'
require 'database_helper'

describe Bookmark do

  describe " .all" do
    it "returns bookmark list" do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy ALL Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.url).to eq("http://www.makersacademy.com")
      expect(bookmarks.first.title).to eq("Makers Academy")
      #expect(bookmarks.first.id).to eq bookmark.first['id']
    end
  end

  describe " .create" do
    it "adds new bookmark to the list" do
      bookmark = Bookmark.create(url: 'http://www.yahoo.com.hk', title: 'Yahoo-HK')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      #expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.url).to eq('http://www.yahoo.com.hk')
      expect(bookmark.title).to eq('Yahoo-HK')
    end
  end

end
