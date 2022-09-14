# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test
end
