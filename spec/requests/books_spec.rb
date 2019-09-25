require 'rails_helper'

RSpec.describe 'Books', type: :request do

  describe 'GET /api/books' do
    context 'default behavior' # Hidden Code
    describe 'field picking'  # Hidden Code
    describe 'pagination' # Hidden Code

       describe 'filtering' do
      context 'with valid filtering param "q[title_cont]=Microscope"' do
        it 'receives "Ruby under a microscope" back' do
          get('/api/books?q[title_cont]=Microscope')
          expect(json_body['data'].first['id']).to eq ruby_microscope.id
          expect(json_body['data'].size).to eq 1
        end
      end

      context 'with invalid filtering param "q[ftitle_cont]=Microscope"' do
        before { get('/api/books?q[ftitle_cont]=Ruby') }

        it 'gets "400 Bad Request" back' do
          expect(response.status).to eq 400
        end

        it 'receives an error' do
          expect(json_body['error']).to_not be nil
        end

        it 'receives "q[ftitle_cont]=Ruby" as an invalid param' do
          expect(json_body['error']['invalid_params']).to eq 'q[ftitle_cont]=Ruby'
        end
      end
    end  # describe 'filtering' end

    

    describe 'sorting' do
      context 'with valid column name "id"' do
        it 'sorts the books by "id desc"' do
          get('/api/books?sort=id&dir=desc')
          expect(json_body['data'].first['id']).to eq agile_web_dev.id
          expect(json_body['data'].last['id']).to eq ruby_microscope.id
        end
      end

      context 'with invalid column name "fid"' do
        before { get '/api/books?sort=fid&dir=asc' }

        it 'gets "400 Bad Request" back' do
          expect(response.status).to eq 400
        end

        it 'receives an error' do
          expect(json_body['error']).to_not be nil
        end

        it 'receives "sort=fid" as an invalid param' do
          expect(json_body['error']['invalid_params']).to eq 'sort=fid'
        end
      end
    end # describe 'sorting' end

  end
end