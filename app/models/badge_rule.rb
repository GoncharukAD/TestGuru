class BadgeRule < ApplicationRecord
  has_many :badges, dependent: :destroy, foreign_key: "rule_id"

end
