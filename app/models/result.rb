class Result < ApplicationRecord
  has_many :users
  has_many :tests
end
