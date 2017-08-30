require 'rails_helper'

RSpec.describe "User visits artist songs index" do
  describe "and clicks on new songs" do
    describe "and fills in title and clicks create" do
      describe "user will see song name" do
        it "will see link to the song artist's show page" do
          artist = create(:artist)

          song_title = "One Love"

          visit "/artists/#{artist.id}"
          click_on "New song"
          fill_in "song_title", with: song_title
          click_on "Create Song"

          expect(page).to have_content(song_title)
          expect(page).to have_link artist.name, href: artist_path(artist)
        end
      end
    end
  end
end
