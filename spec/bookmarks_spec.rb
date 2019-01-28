require 'bookmark'

describe Bookmark do

  describe ".all" do
    it "returns all bookmarks" do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("www.yahoo.com.hk")
      expect(bookmarks).to include("www.google.com")
    end
  end

end
