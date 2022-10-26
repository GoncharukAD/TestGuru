# frozen_string_literal: true

module ApplicationHelper
  def current_year
    t = Time.now
    t.year
  end
end
