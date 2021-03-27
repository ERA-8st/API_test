require 'rails_helper'

RSpec.describe IdeasController, type: :controller do

  let(:category) { create(:category) }
  let(:category2) { create(:category2) }
  let!(:idea) { create(:idea, category_id: category.id) }
  let!(:idea2) { create(:idea2, category_id: category2.id) }

  # describe "index" do

  #   it "全てのIdeaを返す" do
  #     get :index
  #     expect(response).to be_successful
  #     expect(controller.instance_variable_get('@ideas').count).to eq 2
  #   end
  #   it "特定のIdeaを返す" do
  #     get :index, params: { category_name: category.name }
  #     expect(response).to be_successful
  #     expect(controller.instance_variable_get('@ideas').count).to eq 1
  #   end
  #   it "ステータス404を返す" do
  #     get :index, params: { category_name: "test999" }
  #     expect(response).not_to be_successful
  #     expect(response).to have_http_status "404"
  #   end
  # end

  describe "create", use_truncation: true do
    it "ideaのみ作成する" do
      expect{
        post :create, params: { category_name: "test", body: "test_idea" }
      }.to change(category.ideas, :count).by(1)
      expect(response).to be_successful
    end
    it "categoryとideaを作成する" do
      expect{
        post :create, params: { category_name: "test3", body: "test_idea" }
      }.to change(Category, :count).by(1).and change(Idea, :count).by(1)
      expect(response).to be_successful
    end
    it "ステータス422を返す" do
      post :create
      expect(response).to have_http_status "422"
      post :create, params: { category_name: "test" }
      expect(response).to be_successful
    end
    it "idea,categoryが揃わない場合roolbackする" do
      expect{
        post :create, params: { category_name: "test3", body: "" }
      }.to change(Category, :count).by(0).and change(Idea, :count).by(0)
      expect(response).to have_http_status "422"
      expect{
        post :create, params: { category_name: "", body: "test" }
      }.to change(Category, :count).by(0).and change(Idea, :count).by(0)
      expect(response).to have_http_status "422"
    end
  end
  
end
