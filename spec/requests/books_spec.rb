require 'rails_helper'

RSpec.describe 'Books', type: :request do
  # Hidden code

  describe 'GET /api/books' do
    before { books }

    context 'default behavior'  # Hidden code
    describe 'field picking'  # Hidden code

    describe 'embed picking' do

      context "with the 'embed' parameter" do
        before { get '/api/books?embed=author' }

        it 'gets the books with their authors embedded' do
          json_body['data'].each do |book|
            expect(book['author'].keys).to eq(
              ['id', 'given_name', 'family_name', 'created_at', 'updated_at']
            )
          end
        end
      end

      context 'with invalid "embed" relation "fake"' do
        before { get '/api/books?embed=fake,author' }

        it 'gets "400 Bad Request" back' do
          expect(response.status).to eq 400
        end

        it 'receives an error' do
          expect(json_body['error']).to_not be nil
        end

        it 'receives "fields=fid" as an invalid param' do
          expect(json_body['error']['invalid_params']).to eq 'embed=fake'
        end
      end # context "with invalid 'embed' relation 'fake'" end
    end # End of describe 'embed picking'

    describe 'pagination' # Hidden code
    describe 'sorting' # Hidden code
    describe 'filtering'  # Hidden code
  end
end