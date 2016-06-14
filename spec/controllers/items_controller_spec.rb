require 'rails_helper'

# RSpec.describe ItemsController, type: :controller do
#   let(:item) { FactoryGirl.create :task }
#   describe "#index" do
#     it "renders the index page" do
#       get :index
#       expect(response).to have_rendered('/')
#     end
#   end

#   describe "#show" do
#     it "shows the item's page" do
#       get :show
#       expect(response).to have_rendered("items/#{item.id}")
#     end
#   end
# end

RSpec.describe ItemsController do
  let(:new_item) { FactoryGirl.build(:item) }
  let!(:item) { FactoryGirl.create(:item) }
  describe '#index' do
    before(:each) do
      get :index
    end
    it 'responds with a status of 200' do
      expect(response.status).to eq(200)
    end
    it 'assigns the items instance variable' do
      expect(assigns(:items)).to be_an(ActiveRecord::Relation)
    end
  end
  describe '#create' do
    let(:params) {{"item"=>{"title"=>"hello", "text"=>"these are the paramz", "price" => "3.987"}}}
    it 'increments items in the database by 1' do
      expect{post :create, params}.to change{Item.count}.by(1)
    end
    it 'responds with a status of 302' do
      post :create, params
      expect(response.status).to eq(302)
    end
  end
  # describe '#update' do
  #   let(:params) {{"item"=>{"title"=>item.title, "body"=>":("}}, "id"=>item.id}
  #   context 'on valid params' do
  #     it 'responds with a status of 302' do
  #       patch :update, params
  #       expect(response.status).to eq(302)
  #     end
  #     it 'updates an item in the database' do
  #       patch :update, params
  #       expect(item.reload.body).to eq(":(")
  #     end
  #   end
  #   context 'on invalid params' do
  #     let(:params) {{"item"=>{"body"=>''}, "id"=>0000}}
  #     xit 'does not change an item in the database' do
  #     end
  #   end
  # end
  # describe '#destroy' do
  #   it 'responds with a status of 302' do
  #     delete :destroy, id: item.id
  #     expect(response.status).to eq(302)
  #   end
  #   it 'decrements the items in the database by 1' do
  #     expect{delete :destroy, id: item.id}.to change{Item.count}.by(-1)
  #   end
  # end
end
