class Badge < ApplicationRecord
  belongs_to :rule, class_name: "BadgeRule"

  validates :name, :image_url, presence: true
end
