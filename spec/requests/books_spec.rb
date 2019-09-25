RSpec.describe 'Books', type: :request do
  # Hidden Code: let definitions

  describe 'GET /api/books' do
    before { books }

    context 'default behavior' # Hidden Code

    describe 'field picking' do
      context 'with the fields parameter' do
        before { get '/api/books?fields=id,title,author_id' }

        it 'gets books with only the id, title and author_id keys' do
          json_body['data'].each do |book|
            expect(book.keys).to eq ['id', 'title', 'author_id']
          end
        end
      end

      context 'without the "fields" parameter' do
        before { get '/api/books' }

        it 'gets books with all the fields specified in the presenter' do
          json_body['data'].each do |book|
            expect(book.keys).to eq BookPresenter.build_attributes.map(&:to_s)
          end
        end
      end
    end # End of describe 'field picking'
  end
end