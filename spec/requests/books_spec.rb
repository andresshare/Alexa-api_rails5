require 'rails_helper'

RSpec.describe 'Books', type: :request do

  let(:ruby_microscope) { create(:ruby_microscope) }
  let(:rails_tutorial) { create(:ruby_on_rails_tutorial) }
  let(:agile_web_dev) { create(:agile_web_development) }
  let(:books) { [ruby_microscope, rails_tutorial, agile_web_dev] }

  
  describe 'GET /api/books' do  # Hidden Code
  describe 'GET /api/books/:id' do # Hidden Code

  describe 'POST /api/books' do
    let(:author) { create(:michael_hartl) }
    before { post '/api/books', params: { data: params } }

    context 'with valid parameters' do
      let(:params) do
        attributes_for(:ruby_on_rails_tutorial, author_id: author.id)
      end

      it 'gets HTTP status 201' do
        expect(response.status).to eq 201
      end

      it 'receives the newly created resource' do
        expect(json_body['data']['title']).to eq 'Ruby on Rails Tutorial'
      end

      it 'adds a record in the database' do
        expect(Book.count).to eq 1
      end

      it 'gets the new resource location in the Location header' do
        expect(response.headers['Location']).to eq(
          "http://www.example.com/api/books/#{Book.first.id}"
        )
      end
    end
  end # describe 'POST /api/books'


  

describe 'GET /api/books' do  # Hidden Code
  describe 'GET /api/books/:id' do # Hidden Code

  describe 'POST /api/books' do
    let(:author) { create(:michael_hartl) }
    before { post '/api/books', params: { data: params } }

    context 'with valid parameters' # Hidden Code

    context 'with invalid parameters' do
      let(:params) { attributes_for(:ruby_on_rails_tutorial, title: '') }

      it 'gets HTTP status 422' do
        expect(response.status).to eq 422
      end

      it 'receives the error details' do
        expect(json_body['error']['invalid_params']).to eq(
          {'author'=>['must exist', "can't be blank"], 'title'=>["can't be blank"]}
        )
      end

      it 'does not add a record in the database' do
        expect(Book.count).to eq 0
      end
    end # context 'with invalid parameters'

 describe 'GET /api/books' # Hidden Code
  describe 'GET /api/books/:id' # Hidden Code
  describe 'POST /api/books' # Hidden Code

  describe 'PATCH /api/books/:id' do
    before { patch "/api/books/#{rails_tutorial.id}", params: { data: params } }

    context 'with valid parameters' do
      let(:params) { { title: 'The Ruby on Rails Tutorial' } }

      it 'gets HTTP status 200' do
        expect(response.status).to eq 200
      end

      it 'receives the updated resource' do
        expect(json_body['data']['title']).to eq(
          'The Ruby on Rails Tutorial'
        )
      end
      it 'updates the record in the database' do
        expect(Book.first.title).to eq 'The Ruby on Rails Tutorial'
      end
    end

    context 'with invalid parameters' do
      let(:params) { { title: '' } }

      it 'gets HTTP status 422' do
        expect(response.status).to eq 422
      end

      it 'receives the error details' do
        expect(json_body['error']['invalid_params']).to eq(
          { 'title'=>["can't be blank"] }
        )
      end

      it 'does not add a record in the database' do
        expect(Book.first.title).to eq 'Ruby on Rails Tutorial'
      end
    end
  end # describe 'PATCH /api/books/:id' end



describe 'GET /api/books' # Hidden Code
  describe 'GET /api/books/:id' # Hidden Code
  describe 'POST /api/books' # Hidden Code
  describe 'PATCH /api/books/:id' # Hidden Code

  describe 'DELETE /api/books/:id' do
    context 'with existing resource' do
      before { delete "/api/books/#{rails_tutorial.id}" }

      it 'gets HTTP status 204' do
        expect(response.status).to eq 204
      end

      it 'deletes the book from the database' do
        expect(Book.count).to eq 0
      end
    end

    context 'with nonexistent resource' do
      it 'gets HTTP status 404' do
        delete '/api/books/2314323'
        expect(response.status).to eq 404
      end
    end
     end # describe 'DELETE /api/books/:id' end

end



  end












  describe 'GET /api/books' # Hidden Code

  describe 'GET /api/books/:id' do

    context 'with existing resource' do
      before { get "/api/books/#{rails_tutorial.id}" }

      it 'gets HTTP status 200' do
        expect(response.status).to eq 200
      end

      it 'receives the "rails_tutorial" book as JSON' do
        expected = { data: BookPresenter.new(rails_tutorial, {}).fields.embeds }
        expect(response.body).to eq(expected.to_json)
      end
    end

    context 'with nonexistent resource' do
      it 'gets HTTP status 404' do
        get '/api/books/2314323'
        expect(response.status).to eq 404
      end
    end
  end # describe 'GET /api/books/:id'






end
