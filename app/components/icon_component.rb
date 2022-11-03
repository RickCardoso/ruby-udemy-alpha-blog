# frozen_string_literal: true

class IconComponent < ViewComponent::Base
  def initialize(symbol:, fill: 0, weight: 200, grade: 0, optical_size: 24)
    @symbol = symbol
    @fill = fill
    @weight = weight
    @grade = grade
    @optical_size = optical_size
  end

end
