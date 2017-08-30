require 'spec_helper'

RSpec.feature "User visits show page" do
  context "and clicks on edit" do
    context "and fills out a new name" do
      context "and clicks update artist" do
        scenario "user should see updated user page" do
          artist_name = "Bob Marley"
          artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
          artist_1 = Artist.create(name: artist_name, image_path: artist_image_path)

          visit "/artists/#{artist_1.id}"

          expect(current_path).to eq(artist_path(artist_1))
          click_on "Edit artist"
          fill_in('Name', :with => 'New Name')
          click_on "Update Artist"

          expect(current_path).to eq(artist_path(artist_1))
          expect(page).to have_content("New Name")
        end
      end
    end
  end
end
