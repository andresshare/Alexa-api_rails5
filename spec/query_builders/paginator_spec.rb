require 'rails_helper'

RSpec.describe Paginator do
  # Hidden Code: let definitions
  describe '#paginate' # Hidden Code

  describe '#links' do
    let(:links) { paginator.links.split(', ') }

    context 'when first page' do
      let(:params) { { 'page' => '1', 'per' => '2' } }

      it 'builds the "next" relation link' do
        expect(links.first).to eq '<url?page=2&per=2>; rel="next"'
      end

      it 'builds the "last" relation link' do
        expect(links.last).to eq '<url?page=2&per=2>; rel="last"'
      end
    end

    context 'when last page' do
      let(:params) { { 'page' => '2', 'per' => '2' } }

      it 'builds the "first" relation link' do
        expect(links.first).to eq '<url?page=1&per=2>; rel="first"'
      end

      it 'builds the "previous" relation link' do
        expect(links.last).to eq '<url?page=1&per=2>; rel="prev"'
      end
    end
  end # describe '#links' end
end