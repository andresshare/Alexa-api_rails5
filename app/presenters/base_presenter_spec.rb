require 'rails_helper'

RSpec.describe BasePresenter do

  class Presenter < BasePresenter; end

  describe '#initialize' # hidden code
  describe '#as_json' # hidden code

  describe '.build_with' do
    it 'stores ["id","title"] in "build_attributes"' do
      Presenter.build_with :id, :title
      expect(Presenter.build_attributes).to eq ['id', 'title']
    end
  end
end