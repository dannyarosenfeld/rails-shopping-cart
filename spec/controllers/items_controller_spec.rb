require 'rails_helper'
require_relative '../support/auth_helper'

RSpec.describe ItemsController do
  let(:new_item) { FactoryGirl.build(:item) }
  let!(:item) { FactoryGirl.create(:item) }

  include AuthHelper
  before(:each) do
    http_login
  end
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
      let(:params) {{"item"=>{"title"=>"hello", "text"=>"these are the paramz", "price" => 400, "image" => "http://cdn1-www.dogtime.com/assets/uploads/gallery/30-impossibly-cute-puppies/impossibly-cute-puppy-2.jpg",  "quantity" => 2}}}
      it 'increments items in the database by 1' do
        expect{post :create, params}.to change{Item.count}.by(1)
      end
      it 'responds with a status of 302' do
        post :create, params
        expect(response.status).to eq(302)
      end
    end
    describe '#update' do
      let(:params) {{"item"=>{"title"=>item.title, "text"=>":("}, "id"=>item.id}}
      context 'on valid params' do
        it 'responds with a status of 302' do
          patch :update, params
          expect(response.status).to eq(302)
        end
        it 'updates an item in the database' do
          patch :update, params
          expect(item.reload.text).to eq(":(")
        end
      end
      context 'on invalid params' do
        let(:params) {{"item"=>{"text"=>''}, "id"=>item.id}}
        it 'does not change an item in the database' do
          expect(item.text).to eq(item.text)
        end
      end
    end
    describe '#destroy' do
      it 'responds with a status of 302' do
        delete :destroy, id: item.id
        expect(response.status).to eq(302)
      end
      it 'decrements the items in the database by 1' do
        expect{delete :destroy, id: item.id}.to change{Item.count}.by(-1)
      end
    end
  end
