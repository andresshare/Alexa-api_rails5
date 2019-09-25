class ApplicationController < ActionController::API
  rescue_from QueryBuilderError, with: :query_builder_error

  protected

  def query_builder_error  # Hidden Code

  def sort(scope)
    Sorter.new(scope, params).sort
  end

  def paginate # Hidden Code
  def current_url  # Hidden Code
end