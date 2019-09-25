require "rails_helper"

RSpec.describe "Books", type: :request do
  # Hidden Code: let definitions
  describe 'GET /api/books' do
    before { books }

    context 'default behavior' # Hidden Code
    describe 'field picking'  # Hidden Code

    describe 'pagination' do
      context 'when asking for the first page' # Hidden Code
      context 'when asking for the second page' # Hidden Code

      context "when sending invalid 'page' and 'per' parameters" do
        before { get('/api/books?page=fake&per=10') }

        it 'receives HTTP status 400' do
          expect(response.status).to eq 400
        end

        it 'receives an error' do
          expect(json_body['error']).to_not be nil
        end

        it "receives 'page=fake' as an invalid param" do
          expect(json_body['error']['invalid_params']).to eq 'page=fake'
        end
      end
    end # describe 'pagination' end
  end
end