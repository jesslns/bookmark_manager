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

  describe ".delete" do
    it "delets bookmark" do
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end

  describe " .update" do
    it "updates bookmark" do
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      updated_bookmark = Bookmark.update(id: bookmark.id, url: "http://wakersacademy.com", title: "Wakers Academy")

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.url).to eq('http://wakersacademy.com')
      expect(updated_bookmark.title).to eq('Wakers Academy')
    end
  end

  describe " .find" do
    it "finds the bookmark" do
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end

end
