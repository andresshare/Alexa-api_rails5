class BasePresenter
  # Add more class instance attributes
  @relations = []
  @sort_attributes = []
  @filter_attributes = []
  @build_attributes = []

  class << self
    # Define the accessors for the attributes created
    # above
    attr_accessor :relations, :sort_attributes,
                  :filter_attributes, :build_attributes

    def build_with(*args)
      @build_attributes = args.map(&:to_s)
    end

    # Add a bunch of methods that will be used in the
    # model presenters
    def related_to(*args)
      @relations = args.map(&:to_s)
    end

    def sort_by(*args)
      @sort_attributes = args.map(&:to_s)
    end

    def filter_by(*args)
      @filter_attributes = args.map(&:to_s)
    end

  end

  # Hidden Code
  # accessors, initialize, ...
end