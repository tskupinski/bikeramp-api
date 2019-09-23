class SortingQuery
  DIRECTIONS = [:asc, :desc].freeze

  def initialize(relation, field, direction = nil)
    @relation = relation
    @field = field
    @direction = direction || :asc
  end

  def call
    if direction_valid?
      relation.order("#{field} #{direction}")
    else
      relation.order(field)
    end
  end

  private

  attr_reader :relation
  attr_reader :field
  attr_reader :direction

  def direction_valid?
    DIRECTIONS.include?(direction.downcase.to_sym)
  end
end
