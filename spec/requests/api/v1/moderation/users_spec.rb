
RSpec.describe "Api::V1::Moderation::Users", type: :request do
  describe "GET /index" do
    before do
      users = create_list(:user, 2)
      create_list(:comment, 2, user: users.first)
      create_list(:comment, 3, user: users.second)
    end

    it "returns http success" do
      get "/api/v1/moderation/users"
      expect(response).to have_http_status(:success)
    end

    it 'returns expected response' do
      get "/api/v1/moderation/users"
      json_response = JSON.parse(response.body)
      expect(json_response.count).to eq(2)
      expect(json_response.first['comments'].count).to eq(2)
      expect(json_response.second['comments'].count).to eq(3)
    end
  end
end
