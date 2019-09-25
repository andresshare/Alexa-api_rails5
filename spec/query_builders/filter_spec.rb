RSpec.describe Filter do
  # Hidden Code: let definitions and before

  describe '#filter' do
    context 'without any parameters' # Hidden Code
    context 'with valid parameters' # Hidden Code

    context 'with invalid parameters' do
      context 'with invalid column name "fid"' do
        let(:params) { { 'q' => { 'fid_gt' => '2' } } }

        it 'raises a "QueryBuilderError" exception' do
          expect { filtered }.to raise_error(QueryBuilderError)
        end
      end

      context 'with invalid predicate "gtz"' do
        let(:params) { { 'q' => { 'id_gtz' => '2' } } }

        it 'raises a "QueryBuilderError" exception' do
          expect { filtered }.to raise_error(QueryBuilderError)
        end
      end
    end # context 'with invalid parameters' end

  end
end