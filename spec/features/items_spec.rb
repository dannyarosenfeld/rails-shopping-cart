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
  describe "item page" do
    before(:each) do
      visit edit_item_path(item.id)
    end
    it "displays a form and updates an existing post" do
      new_title = "Test updated title"
      fill_in('Title', with: new_title)
      click_on('Save Item')
      expect(page).to have_content(new_title)
    end
    it "has a button that deletes the article" do
      visit root_path(item.id)
      click_on('Delete')
      page.accept_alert
      expect(page).to_not have_content(item.title)
    end
  end
end
