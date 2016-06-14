require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { FactoryGirl.build :item}
  context "#save" do
    it "returns true" do
      expect {
        item.save
      }.to change(Item,:count).by(1)
    end
  end

  context "#validations" do
    it { should validate_presence_of :title}
    it { should validate_presence_of :text}
    it { should validate_presence_of :price}
    it { should validate_presence_of :image}
  end
end
