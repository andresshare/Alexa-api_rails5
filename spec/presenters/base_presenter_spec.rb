require 'rails_helper'

RSpec.describe BasePresenter do

  class Presenter < BasePresenter; end

  describe '#initialize' # Hidden code
  describe '#as_json' # Hidden code
  describe '.build_with' # Hidden Code

  describe '.related_to' do
    it 'stores the correct value' do
      Presenter.related_to :author, :publisher
      expect(Presenter.relations).to eq ['author', 'publisher']
    end
  end

  describe '.sort_by' do
    it 'stores the correct value' do
      Presenter.sort_by :id, :title
      expect(Presenter.sort_attributes).to eq ['id', 'title']
    end
  end

  describe '.filter_by' do
    it 'stores the correct value' do
      Presenter.filter_by :title
      expect(Presenter.filter_attributes).to eq ['title']
    end
  end

end