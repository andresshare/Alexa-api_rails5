require 'rails_helper'

RSpec.describe Sorter do

  # Hidden Code: let definitions

  describe '#sort' do
    context 'without any parameters' # Hidden Code
    context 'with valid parameters' # Hidden Code

    context 'with invalid parameters' do
      let(:params) { HashWithIndifferentAccess.new({ sort: 'fid', dir: 'desc' }) }
      it 'raises a QueryBuilderError exception' do
        expect { sorted }.to raise_error(QueryBuilderError)
      end
    end

  end

end