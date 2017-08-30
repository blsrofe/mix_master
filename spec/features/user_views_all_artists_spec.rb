require 'rails_helper'

RSpec.feature "User visits the artist index" do
  context "user should see each artist's name" do
    scenario "they should see an individual artist name when they click on an artist" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist_1 = Artist.create(name: artist_name, image_path: artist_image_path)

    visit '/artists'

    expect(current_path).to eq(artists_path)
    expect(page).to have_content("Bob Marley")
    click_link('Bob Marley')

    expect(current_path).to eq(artist_path(artist_1))
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
    end
  end
end
