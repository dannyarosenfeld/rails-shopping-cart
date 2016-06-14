require 'rails_helper'

RSpec.feature "Items", type: :feature, :js => true do
  let!(:item) { FactoryGirl.create :item }
  describe "#index" do
    it "returns list of all the items" do
      visit root_path
      expect(page).to have_content(item.title)
    end
  end

  describe "#create" do
    it "fills in text in the form and renders item page" do
      visit new_item_path
      fill_in "Title", :with => item.title
      fill_in "Text", :with => item.text
      fill_in "Price", :with => item.price
      fill_in "Image", :with => item.image
      click_button "Save Item"
      expect(page).to have_content(item.text)
    end
  end
end
