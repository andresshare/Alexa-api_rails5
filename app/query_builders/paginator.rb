class Paginator

  def initialize(scope, query_params, url)
    @query_params = query_params
    @page = validate_param!('page', 1)
    @per = validate_param!('per', 10)
    @scope = scope.page(@page).per(@per)
    @url = url
  end

  def paginate # Hidden Code
  def links # Hidden Code

  private

  def validate_param!(name, default)
    return default unless @query_params[name]
    unless (@query_params[name] =~ /\A\d+\z/)
      raise QueryBuilderError.new("#{name}=#{@query_params[name]}"),
      'Invalid Pagination params. Only numbers are supported for "page" and "per".'
    end
    @query_params[name]
  end

  def pages # Hidden Code
  def show_first_link? # Hidden Code
  def show_previous_link? # Hidden Code
  def show_next_link? # Hidden Code
  def show_last_link? # Hidden Code

end