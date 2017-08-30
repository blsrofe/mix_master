require 'rails_helper'

RSpec.describe "User visits artist show page" do
  describe "and clicks on delete" do
    it "should not see the artist's name on the show page" do
      artist_name = "Bob Marley"
      artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
      artist_1 = Artist.create(name: artist_name, image_path: artist_image_path)
      artist_2 = Artist.create(name: "New Artist", image_path: artist_image_path)

      visit "/artists/#{artist_1.id}"

      expect(current_path).to eq(artist_path(artist_1))
      click_on "Delete"
      expect(current_path).to eq(artists_path)
      expect(page).to have_no_content("Bob Marley")
    end
  end
end
