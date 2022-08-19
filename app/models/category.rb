class Category < ApplicationRecord
  has_many :test, dependent: :destroy
end
