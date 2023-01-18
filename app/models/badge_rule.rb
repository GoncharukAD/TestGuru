class BadgeRule < ApplicationRecord
  has_many :badges, dependent: :destroy, foreign_key: "rule_id"

  validates :rule_type, :value, numericality: { only_integer: true }
end
